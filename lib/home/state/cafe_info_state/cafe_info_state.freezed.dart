// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CafeInfoState {
  CafeEvent get cafeEvent => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  CafeModel? get cafeModel => throw _privateConstructorUsedError;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeInfoStateCopyWith<CafeInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeInfoStateCopyWith<$Res> {
  factory $CafeInfoStateCopyWith(
          CafeInfoState value, $Res Function(CafeInfoState) then) =
      _$CafeInfoStateCopyWithImpl<$Res, CafeInfoState>;
  @useResult
  $Res call({CafeEvent cafeEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class _$CafeInfoStateCopyWithImpl<$Res, $Val extends CafeInfoState>
    implements $CafeInfoStateCopyWith<$Res> {
  _$CafeInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_value.copyWith(
      cafeEvent: null == cafeEvent
          ? _value.cafeEvent
          : cafeEvent // ignore: cast_nullable_to_non_nullable
              as CafeEvent,
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
abstract class _$$CafeInfoStateImplCopyWith<$Res>
    implements $CafeInfoStateCopyWith<$Res> {
  factory _$$CafeInfoStateImplCopyWith(
          _$CafeInfoStateImpl value, $Res Function(_$CafeInfoStateImpl) then) =
      __$$CafeInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CafeEvent cafeEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class __$$CafeInfoStateImplCopyWithImpl<$Res>
    extends _$CafeInfoStateCopyWithImpl<$Res, _$CafeInfoStateImpl>
    implements _$$CafeInfoStateImplCopyWith<$Res> {
  __$$CafeInfoStateImplCopyWithImpl(
      _$CafeInfoStateImpl _value, $Res Function(_$CafeInfoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_$CafeInfoStateImpl(
      cafeEvent: null == cafeEvent
          ? _value.cafeEvent
          : cafeEvent // ignore: cast_nullable_to_non_nullable
              as CafeEvent,
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

class _$CafeInfoStateImpl implements _CafeInfoState {
  const _$CafeInfoStateImpl(
      {required this.cafeEvent, this.response, this.cafeModel});

  @override
  final CafeEvent cafeEvent;
  @override
  final String? response;
  @override
  final CafeModel? cafeModel;

  @override
  String toString() {
    return 'CafeInfoState(cafeEvent: $cafeEvent, response: $response, cafeModel: $cafeModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeInfoStateImpl &&
            (identical(other.cafeEvent, cafeEvent) ||
                other.cafeEvent == cafeEvent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.cafeModel, cafeModel) ||
                other.cafeModel == cafeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cafeEvent, response, cafeModel);

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeInfoStateImplCopyWith<_$CafeInfoStateImpl> get copyWith =>
      __$$CafeInfoStateImplCopyWithImpl<_$CafeInfoStateImpl>(this, _$identity);
}

abstract class _CafeInfoState implements CafeInfoState {
  const factory _CafeInfoState(
      {required final CafeEvent cafeEvent,
      final String? response,
      final CafeModel? cafeModel}) = _$CafeInfoStateImpl;

  @override
  CafeEvent get cafeEvent;
  @override
  String? get response;
  @override
  CafeModel? get cafeModel;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeInfoStateImplCopyWith<_$CafeInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
