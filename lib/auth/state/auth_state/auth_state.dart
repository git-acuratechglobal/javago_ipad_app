
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/cafe_model.dart';

part "auth_state.freezed.dart";

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AuthEvent authEvent,
    String? response,
    CafeModel? cafeModel,
  }) = _AuthState;

}

enum AuthEvent {
  login,
  signUp,
  forgotPassword,
  restPassword,
}

