import 'package:java_go/auth/params/cafe_info_params.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/local_storage_service.dart';
import '../state/auth_state/auth_state.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  String? _email;
  String? _password;
  @override
  FutureOr<AuthState?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final loginResult =
          await ref.watch(authServiceProvider).login(email, password);

      return AuthState(
        authEvent: AuthEvent.login,
        response: loginResult,
      );
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
      return AuthState(
        authEvent: AuthEvent.addCafeInfo,
        response: data,
      );
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

  void updateEmail({required email}) {
    _email = email;
  }

  void updatePassword({required password}) {
    _password = password;
  }
}
