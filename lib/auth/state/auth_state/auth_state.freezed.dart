// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  AuthEvent get authEvent;
  String? get response;
  CafeModel? get cafeModel;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<AuthState> get copyWith =>
      _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthState &&
            (identical(other.authEvent, authEvent) ||
                other.authEvent == authEvent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.cafeModel, cafeModel) ||
                other.cafeModel == cafeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authEvent, response, cafeModel);

  @override
  String toString() {
    return 'AuthState(authEvent: $authEvent, response: $response, cafeModel: $cafeModel)';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call({AuthEvent authEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_self.copyWith(
      authEvent: null == authEvent
          ? _self.authEvent
          : authEvent // ignore: cast_nullable_to_non_nullable
              as AuthEvent,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeModel: freezed == cafeModel
          ? _self.cafeModel
          : cafeModel // ignore: cast_nullable_to_non_nullable
              as CafeModel?,
    ));
  }
}

/// @nodoc

class _AuthState implements AuthState {
  const _AuthState({required this.authEvent, this.response, this.cafeModel});

  @override
  final AuthEvent authEvent;
  @override
  final String? response;
  @override
  final CafeModel? cafeModel;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.authEvent, authEvent) ||
                other.authEvent == authEvent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.cafeModel, cafeModel) ||
                other.cafeModel == cafeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authEvent, response, cafeModel);

  @override
  String toString() {
    return 'AuthState(authEvent: $authEvent, response: $response, cafeModel: $cafeModel)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call({AuthEvent authEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_AuthState(
      authEvent: null == authEvent
          ? _self.authEvent
          : authEvent // ignore: cast_nullable_to_non_nullable
              as AuthEvent,
      response: freezed == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeModel: freezed == cafeModel
          ? _self.cafeModel
          : cafeModel // ignore: cast_nullable_to_non_nullable
              as CafeModel?,
    ));
  }
}

// dart format on
