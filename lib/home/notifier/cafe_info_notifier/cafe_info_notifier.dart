import 'package:java_go/home/state/cafe_info_state/cafe_info_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/model/cafe_model.dart';
import '../../../auth/model/cafe_time_and_category.dart';
import '../../../auth/model/cafetime_model.dart';
import '../../../auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../../../auth/params/cafe_info_params.dart';
import '../../../service/auth_service.dart';
part 'cafe_info_notifier.g.dart';

@riverpod
class CafeInfoNotifier extends _$CafeInfoNotifier {
  Map<String, dynamic> _clickAndCollectForm = {};

  @override
 FutureOr<CafeInfoState?>  build() {
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
      final clickAndCollect = _clickAndCollectForm['clickAndCollect'];

      final message =
      await ref.watch(authServiceProvider).updateClickAndCollect(
        clickAndCollect: clickAndCollect,
        maxOrders: clickAndCollect == 1
            ? _clickAndCollectForm['maxOrders']
            : null,
      );
      if (clickAndCollect == 1) {
        final data = (await ref.watch(getCafeInfoProvider.future));
        final rawCafeTimes = _clickAndCollectForm['cafeTimes'];
        final List<CafeDayTime> cafeTimes = rawCafeTimes != null
            ? List<CafeDayTime>.from(rawCafeTimes)
            : (data?.cafeClickCollectTiming?.isNotEmpty ?? false)
            ? convertCafeTimingToCafeDayTime(data!.cafeClickCollectTiming!)
            : (data?.timing != null)
            ? convertCafeTimingToCafeDayTime(data!.timing!)
            : [];
        await ref
            .watch(authServiceProvider)
            .updateCollectionTime(cafeTimes: cafeTimes);
        ref.invalidate(getCafeInfoProvider);
        return CafeInfoState(
          cafeEvent: CafeEvent.updateClickAndCollect,
          response: message,
        );
      }
      return null;
    });
  }

  Future<void> updateCafeInformation() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cafeInfoParams = ref.watch(cafeInfoParamsNotifierProvider);
      final data = await ref
          .watch(authServiceProvider)
          .updateCafeInfo(cafeInfoParams: cafeInfoParams);
      return CafeInfoState(
        cafeEvent: CafeEvent.addCafeInfo,
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



  void updateForm({required String key, required dynamic value}) {
    _clickAndCollectForm[key] = value;
  }

  List<CafeDayTime> convertCafeTimingToCafeDayTime(List<dynamic> list) {
    return list.map((item) {
      if (item is CafeClickCollectTiming) {
        return CafeDayTime(
          day: item.day ?? '',
          openingTime:
          const TimeOfDayConverter().fromJson(item.startTime ?? '00:00'),
          closingTime:
          const TimeOfDayConverter().fromJson(item.endTime ?? '00:00'),
          isActive: item.isActive ?? 1,
        );
      } else if (item is CafeTiming) {
        return CafeDayTime(
          day: item.day?.toString() ?? '',
          openingTime:
          const TimeOfDayConverter().fromJson(item.openTime ?? '00:00'),
          closingTime:
          const TimeOfDayConverter().fromJson(item.closeTime ?? '00:00'),
          isActive: item.isActive ?? 1,
        );
      } else {
        throw Exception("Unsupported timing type");
      }
    }).toList();
  }





}
