
import 'package:freezed_annotation/freezed_annotation.dart';

part "auth_state.freezed.dart";

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AuthEvent authEvent,
    String? response,
  }) = _AuthState;

}

enum AuthEvent {
  login,
  signUp,
  forgotPassword,
  restPassword,
  editProfile,
  updateDisplayName,
  updateProfileImage
}

