// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CafeInfoState {
  CafeEvent get cafeEvent;
  String? get response;
  CafeModel? get cafeModel;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CafeInfoStateCopyWith<CafeInfoState> get copyWith =>
      _$CafeInfoStateCopyWithImpl<CafeInfoState>(
          this as CafeInfoState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CafeInfoState &&
            (identical(other.cafeEvent, cafeEvent) ||
                other.cafeEvent == cafeEvent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.cafeModel, cafeModel) ||
                other.cafeModel == cafeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cafeEvent, response, cafeModel);

  @override
  String toString() {
    return 'CafeInfoState(cafeEvent: $cafeEvent, response: $response, cafeModel: $cafeModel)';
  }
}

/// @nodoc
abstract mixin class $CafeInfoStateCopyWith<$Res> {
  factory $CafeInfoStateCopyWith(
          CafeInfoState value, $Res Function(CafeInfoState) _then) =
      _$CafeInfoStateCopyWithImpl;
  @useResult
  $Res call({CafeEvent cafeEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class _$CafeInfoStateCopyWithImpl<$Res>
    implements $CafeInfoStateCopyWith<$Res> {
  _$CafeInfoStateCopyWithImpl(this._self, this._then);

  final CafeInfoState _self;
  final $Res Function(CafeInfoState) _then;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cafeEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_self.copyWith(
      cafeEvent: null == cafeEvent
          ? _self.cafeEvent
          : cafeEvent // ignore: cast_nullable_to_non_nullable
              as CafeEvent,
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

class _CafeInfoState implements CafeInfoState {
  const _CafeInfoState(
      {required this.cafeEvent, this.response, this.cafeModel});

  @override
  final CafeEvent cafeEvent;
  @override
  final String? response;
  @override
  final CafeModel? cafeModel;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CafeInfoStateCopyWith<_CafeInfoState> get copyWith =>
      __$CafeInfoStateCopyWithImpl<_CafeInfoState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CafeInfoState &&
            (identical(other.cafeEvent, cafeEvent) ||
                other.cafeEvent == cafeEvent) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.cafeModel, cafeModel) ||
                other.cafeModel == cafeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cafeEvent, response, cafeModel);

  @override
  String toString() {
    return 'CafeInfoState(cafeEvent: $cafeEvent, response: $response, cafeModel: $cafeModel)';
  }
}

/// @nodoc
abstract mixin class _$CafeInfoStateCopyWith<$Res>
    implements $CafeInfoStateCopyWith<$Res> {
  factory _$CafeInfoStateCopyWith(
          _CafeInfoState value, $Res Function(_CafeInfoState) _then) =
      __$CafeInfoStateCopyWithImpl;
  @override
  @useResult
  $Res call({CafeEvent cafeEvent, String? response, CafeModel? cafeModel});
}

/// @nodoc
class __$CafeInfoStateCopyWithImpl<$Res>
    implements _$CafeInfoStateCopyWith<$Res> {
  __$CafeInfoStateCopyWithImpl(this._self, this._then);

  final _CafeInfoState _self;
  final $Res Function(_CafeInfoState) _then;

  /// Create a copy of CafeInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cafeEvent = null,
    Object? response = freezed,
    Object? cafeModel = freezed,
  }) {
    return _then(_CafeInfoState(
      cafeEvent: null == cafeEvent
          ? _self.cafeEvent
          : cafeEvent // ignore: cast_nullable_to_non_nullable
              as CafeEvent,
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
