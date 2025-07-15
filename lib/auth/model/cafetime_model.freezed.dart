// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafetime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CafeDayTime _$CafeDayTimeFromJson(Map<String, dynamic> json) {
  return _CafeDayTime.fromJson(json);
}

/// @nodoc
mixin _$CafeDayTime {
  String get day => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get openingTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get closingTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int get isActive => throw _privateConstructorUsedError;

  /// Serializes this CafeDayTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeDayTimeCopyWith<CafeDayTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeDayTimeCopyWith<$Res> {
  factory $CafeDayTimeCopyWith(
          CafeDayTime value, $Res Function(CafeDayTime) then) =
      _$CafeDayTimeCopyWithImpl<$Res, CafeDayTime>;
  @useResult
  $Res call(
      {String day,
      @TimeOfDayConverter() TimeOfDay openingTime,
      @TimeOfDayConverter() TimeOfDay closingTime,
      @JsonKey(name: 'is_active') int isActive});
}

/// @nodoc
class _$CafeDayTimeCopyWithImpl<$Res, $Val extends CafeDayTime>
    implements $CafeDayTimeCopyWith<$Res> {
  _$CafeDayTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? openingTime = null,
    Object? closingTime = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      openingTime: null == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      closingTime: null == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CafeDayTimeImplCopyWith<$Res>
    implements $CafeDayTimeCopyWith<$Res> {
  factory _$$CafeDayTimeImplCopyWith(
          _$CafeDayTimeImpl value, $Res Function(_$CafeDayTimeImpl) then) =
      __$$CafeDayTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String day,
      @TimeOfDayConverter() TimeOfDay openingTime,
      @TimeOfDayConverter() TimeOfDay closingTime,
      @JsonKey(name: 'is_active') int isActive});
}

/// @nodoc
class __$$CafeDayTimeImplCopyWithImpl<$Res>
    extends _$CafeDayTimeCopyWithImpl<$Res, _$CafeDayTimeImpl>
    implements _$$CafeDayTimeImplCopyWith<$Res> {
  __$$CafeDayTimeImplCopyWithImpl(
      _$CafeDayTimeImpl _value, $Res Function(_$CafeDayTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? openingTime = null,
    Object? closingTime = null,
    Object? isActive = null,
  }) {
    return _then(_$CafeDayTimeImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      openingTime: null == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      closingTime: null == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeDayTimeImpl implements _CafeDayTime {
  const _$CafeDayTimeImpl(
      {required this.day,
      @TimeOfDayConverter() required this.openingTime,
      @TimeOfDayConverter() required this.closingTime,
      @JsonKey(name: 'is_active') this.isActive = 1});

  factory _$CafeDayTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeDayTimeImplFromJson(json);

  @override
  final String day;
  @override
  @TimeOfDayConverter()
  final TimeOfDay openingTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay closingTime;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;

  @override
  String toString() {
    return 'CafeDayTime(day: $day, openingTime: $openingTime, closingTime: $closingTime, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeDayTimeImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.openingTime, openingTime) ||
                other.openingTime == openingTime) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, day, openingTime, closingTime, isActive);

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeDayTimeImplCopyWith<_$CafeDayTimeImpl> get copyWith =>
      __$$CafeDayTimeImplCopyWithImpl<_$CafeDayTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeDayTimeImplToJson(
      this,
    );
  }
}

abstract class _CafeDayTime implements CafeDayTime {
  const factory _CafeDayTime(
      {required final String day,
      @TimeOfDayConverter() required final TimeOfDay openingTime,
      @TimeOfDayConverter() required final TimeOfDay closingTime,
      @JsonKey(name: 'is_active') final int isActive}) = _$CafeDayTimeImpl;

  factory _CafeDayTime.fromJson(Map<String, dynamic> json) =
      _$CafeDayTimeImpl.fromJson;

  @override
  String get day;
  @override
  @TimeOfDayConverter()
  TimeOfDay get openingTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay get closingTime;
  @override
  @JsonKey(name: 'is_active')
  int get isActive;

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeDayTimeImplCopyWith<_$CafeDayTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
