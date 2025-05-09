import 'package:java_go/login/auth_state/auth_state.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthState?> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final loginResult = await ref.watch(authServiceProvider).login(email, password);

      return AuthState(
        authEvent: AuthEvent.login,
        response: loginResult,
      );
    });
  }
}
