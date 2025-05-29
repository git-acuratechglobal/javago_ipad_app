import 'package:java_go/auth/params/cafe_info_params.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/local_storage_service.dart';
import '../model/cafe_model.dart';
import '../model/cafe_time_and_category.dart';
import '../model/cafetime_model.dart';
import '../state/auth_state/auth_state.dart';
import 'cafe_data_notifier/cafe_data_notifier.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String? _email;
  String? _password;
  Map<String, dynamic> _clickAndCollectForm = {};
  @override
  FutureOr<AuthState?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final loginResult =
          await ref.watch(authServiceProvider).login(email, password);
      final cafeModel = await ref.read(authServiceProvider).getCafeData();
      return AuthState(
          authEvent: AuthEvent.login,
          response: loginResult,
          cafeModel: cafeModel);
    });
  }

  Future<void> signUp() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final signUpResult =
          await ref.watch(authServiceProvider).signUp(_email, _password);
      ref.invalidate(localStorageServiceProvider);
      return AuthState(
        authEvent: AuthEvent.signUp,
        response: signUpResult,
      );
    });
  }

  Future<void> addCafeInformation() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cafeInfoParams = ref.watch(cafeInfoParamsNotifierProvider);
      final data = await ref
          .watch(authServiceProvider)
          .addCafeInfo(cafeInfoParams: cafeInfoParams);
      if (cafeInfoParams.cafeTimes != null &&
          cafeInfoParams.cafeTimes!.isNotEmpty)
        final cafeHours = await ref
            .watch(authServiceProvider)
            .updateCafeHours(cafeTimes: cafeInfoParams.cafeTimes!);
      ref.invalidate(getCafeInfoProvider);
      return AuthState(
        authEvent: AuthEvent.addCafeInfo,
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
            : (data?.cafeClickCollectTiming ?? data?.timing) != null
                ? convertCafeTimingToCafeDayTime(
                    data!.cafeClickCollectTiming ?? data.timing!)
                : [];
        await ref
            .watch(authServiceProvider)
            .updateCollectionTime(cafeTimes: cafeTimes);

        return AuthState(
          authEvent: AuthEvent.updateClickAndCollect,
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
      return AuthState(
        authEvent: AuthEvent.addCafeInfo,
        response: data,
      );
    });
  }

  Future<void> publishCafe() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await ref.watch(authServiceProvider).publish();
      return AuthState(
        authEvent: AuthEvent.publishCafe,
        response: data,
      );
    });
  }

  void updateEmail({required email}) {
    _email = email;
  }

  void updatePassword({required password}) {
    _password = password;
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
