import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:java_go/auth/params/click_and_collect_params.dart';
import 'package:java_go/home/state/cafe_info_state/cafe_info_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../../../auth/params/cafe_info_params.dart';
import '../../../service/auth_service.dart';
import '../../../service/strip_service.dart';
import '../../notifiers/menu_item_showing.dart';
part 'cafe_info_notifier.g.dart';

@riverpod
class CafeInfoNotifier extends _$CafeInfoNotifier {
  Map<String, dynamic>? _paymentIntent;
  @override
  FutureOr<CafeInfoState?> build() {
    return null;
  }

  Future<void> addCafeInformation() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cafeInfoParams = ref.watch(cafeInfoParamsNotifierProvider);
      // final result = await ref.watch(authServiceProvider).getLatLngFromZipcode(
      //     address: cafeInfoParams.address, zipcode: cafeInfoParams.postcode);
      // ref
      //     .read(cafeInfoParamsNotifierProvider.notifier)
      //     .updateLatitude(result!['lat']!);
      // ref
      //     .read(cafeInfoParamsNotifierProvider.notifier)
      //     .updateLongitude(result['lng']!);
      final data = await ref
          .watch(authServiceProvider)
          .addCafeInfo(cafeInfoParams: cafeInfoParams);
      if (cafeInfoParams.cafeTimes != null &&
          cafeInfoParams.cafeTimes!.isNotEmpty)
        await ref
            .watch(authServiceProvider)
            .updateCafeHours(cafeTimes: cafeInfoParams.cafeTimes!);
      ref.invalidate(getCafeInfoProvider);
      return CafeInfoState(
        cafeEvent: CafeEvent.addCafeInfo,
        response: data,
      );
    });
  }

  Future<void> updateClickAndCollect() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final clickAnCollectParams = ref.watch(clickAndCollectParamProvider);

      final message = await ref
          .watch(authServiceProvider)
          .updateClickAndCollect(param: clickAnCollectParams);
      if (clickAnCollectParams.click_and_collect == 1) {
        await ref.watch(authServiceProvider).updateCollectionTime(
            cafeTimes: clickAnCollectParams.clickAndCollectTime);
        ref.invalidate(getCafeInfoProvider);
        return CafeInfoState(
          cafeEvent: CafeEvent.updateClickAndCollect,
          response: message,
        );
      }
      ref.invalidate(getCafeInfoProvider);
      return CafeInfoState(
        cafeEvent: CafeEvent.updateClickAndCollect,
        response: message,
      );
    });
  }

  Future<void> updateCafeInformation() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cafeInfoParams = ref.watch(cafeInfoParamsNotifierProvider);
      final data = await ref
          .watch(authServiceProvider)
          .addCafeInfo(cafeInfoParams: cafeInfoParams);
      if (cafeInfoParams.cafeTimes != null &&
          cafeInfoParams.cafeTimes!.isNotEmpty)
        await ref
            .watch(authServiceProvider)
            .updateCafeHours(cafeTimes: cafeInfoParams.cafeTimes!);
      ref.invalidate(getCafeInfoProvider);
      return CafeInfoState(
        cafeEvent: CafeEvent.updateCafeInfo,
        response: data,
      );
    });
  }

  Future<void> downloadFile() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).getSampleFileLink();
      return CafeInfoState(
        cafeEvent: CafeEvent.downloadSampleFile,
        response: data,
      );
    });
  }

  Future<void> uploadPickedFile() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final path = await _pickFile();
      final data = await ref.watch(authServiceProvider).uploadFile(path);
      ref.watch(authServiceProvider).syncMenuToSquare().ignore();
      ref.invalidate(showMenuItemssProvider);
      return CafeInfoState(
        cafeEvent: CafeEvent.fileUploaded,
        response: data,
      );
    });
  }

  Future<void> createStripAccount() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).createStripAccount();
      return CafeInfoState(
        cafeEvent: CafeEvent.createStripAccount,
        response: data,
      );
    });
  }

  Future<void> createSquareAccount() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).createSquareAccount();
      return CafeInfoState(
        cafeEvent: CafeEvent.createSquareAccount,
        response: data,
      );
    });
  }

  Future<void> squareAccountCreated() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.watch(authServiceProvider).syncMenuCategory().then((val) {
         ref.watch(authServiceProvider).syncMenuFromSquare().ignore();
        ref.watch(authServiceProvider).syncMenuToSquare().ignore();
      });
      return CafeInfoState(
        cafeEvent: CafeEvent.squareAccountCreated,
        response: "Your Square Account Connected",
      );
    });
  }

  Future<void> syncMenuFromSquare() async {
    state= AsyncLoading();
    state= await AsyncValue.guard(()async{
      await ref.watch(authServiceProvider).syncMenuFromSquare();
      ref.invalidate(showMenuItemssProvider);
      return CafeInfoState(
        cafeEvent: CafeEvent.syncItemFromSquare,
        response: "Items synced from Square",
      );
    });
  }


  Future<void> stripAccountStatus() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).stripAccountStatus();
      ref.invalidate(getCafeInfoProvider);
      return CafeInfoState(
        cafeEvent: CafeEvent.stripAccountStatus,
        response: data.toString(),
      );
    });
  }

  Future<void> purchaseSubscription({required double amount}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final stripeService = ref.read(stripeServiceProvider);
      _paymentIntent ??= await stripeService.createPaymentIntent(amount);
      await _attemptPayment(_paymentIntent!['client_secret']);
      return CafeInfoState(
        cafeEvent: CafeEvent.subscriptionPurchase,
      );
    });
  }

  Future<void> syncMenuToSquare() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).syncMenuToSquare();
      return CafeInfoState(
          cafeEvent: CafeEvent.syncMenuToSquare, response: data);
    });
  }

  Future<void> publishCafe() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).publish();
      return CafeInfoState(
        cafeEvent: CafeEvent.publishCafe,
        response: data,
      );
    });
  }

  Future<void> launch(String url) async {
    final uri = Uri.parse(url);
    await _launchUrl(uri);
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<String> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );
      if (result != null && result.files.single.path != null) {
        File file = File(
          result.files.single.path!,
        );

        String fileName = file.path;
        return fileName;
      } else {
        throw Exception("No file selected");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _attemptPayment(String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'JavaGo',
          paymentIntentClientSecret: clientSecret,
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      final errorMessage = e.error.message ?? e.error.toString();

      throw "Failed to attempt payment: $errorMessage";
    } catch (e) {
      rethrow;
    }
  }
}
