import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../service/local_storage_service.dart';
import '../model/cafe_model.dart';
import '../model/cafe_time_and_category.dart';
import '../model/cafetime_model.dart';
import '../state/auth_state/auth_state.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String? _email;
  String? _password;
  String? _newPassword;
  @override
  FutureOr<AuthState?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final loginResult =
          await ref.watch(authServiceProvider).login(email, password);
      ref.invalidate(localStorageServiceProvider);
      final token = ref.read(localStorageServiceProvider).getFcmToken();
      if (token != null) {
        await ref.watch(authServiceProvider).updateFcmToken(token);
      }
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
      final token = ref.read(localStorageServiceProvider).getFcmToken();
      if (token != null) {
        await ref.watch(authServiceProvider).updateFcmToken(token);
      }
      return AuthState(
        authEvent: AuthEvent.signUp,
        response: signUpResult,
      );
    });
  }

  Future<void> updateNewPassword() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final signUpResult = await ref
          .watch(authServiceProvider)
          .updatePassword(_password, _newPassword);
      return AuthState(
        authEvent: AuthEvent.updatePassword,
        response: signUpResult,
      );
    });
  }

  void updateEmail({required email}) {
    _email = email;
  }

  void updatePassword({required password}) {
    _password = password;
  }

  void newPassword({required password}) {
    _newPassword = password;
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
