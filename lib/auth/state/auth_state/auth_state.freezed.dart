// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  AuthEvent get authEvent => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  CafeModel? get cafeModel => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthEvent authEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_value.copyWith(
      authEvent: null == authEvent
          ? _value.authEvent
          : authEvent // ignore: cast_nullable_to_non_nullable
              as AuthEvent,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeModel: freezed == cafeModel
          ? _value.cafeModel
          : cafeModel // ignore: cast_nullable_to_non_nullable
              as CafeModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEvent authEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_$AuthStateImpl(
      authEvent: null == authEvent
          ? _value.authEvent
          : authEvent // ignore: cast_nullable_to_non_nullable
              as AuthEvent,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeModel: freezed == cafeModel
          ? _value.cafeModel
          : cafeModel // ignore: cast_nullable_to_non_nullable
              as CafeModel?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.authEvent, this.response, this.cafeModel});

  @override
  final AuthEvent authEvent;
  @override
  final String? response;
  @override
  final CafeModel? cafeModel;

  @override
  String toString() {
    return 'AuthState(authEvent: $authEvent, response: $response, cafeModel: $cafeModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.authEvent, authEvent) ||
                other.authEvent == authEvent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.cafeModel, cafeModel) ||
                other.cafeModel == cafeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authEvent, response, cafeModel);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final AuthEvent authEvent,
      final String? response,
      final CafeModel? cafeModel}) = _$AuthStateImpl;

  @override
  AuthEvent get authEvent;
  @override
  String? get response;
  @override
  CafeModel? get cafeModel;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
