// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafetime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CafeDayTime {
  String get day;
  @TimeOfDayConverter()
  TimeOfDay get openingTime;
  @TimeOfDayConverter()
  TimeOfDay get closingTime;
  @JsonKey(name: 'is_active')
  int get isActive;

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CafeDayTimeCopyWith<CafeDayTime> get copyWith =>
      _$CafeDayTimeCopyWithImpl<CafeDayTime>(this as CafeDayTime, _$identity);

  /// Serializes this CafeDayTime to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CafeDayTime &&
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

  @override
  String toString() {
    return 'CafeDayTime(day: $day, openingTime: $openingTime, closingTime: $closingTime, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $CafeDayTimeCopyWith<$Res> {
  factory $CafeDayTimeCopyWith(
          CafeDayTime value, $Res Function(CafeDayTime) _then) =
      _$CafeDayTimeCopyWithImpl;
  @useResult
  $Res call(
      {String day,
      @TimeOfDayConverter() TimeOfDay openingTime,
      @TimeOfDayConverter() TimeOfDay closingTime,
      @JsonKey(name: 'is_active') int isActive});
}

/// @nodoc
class _$CafeDayTimeCopyWithImpl<$Res> implements $CafeDayTimeCopyWith<$Res> {
  _$CafeDayTimeCopyWithImpl(this._self, this._then);

  final CafeDayTime _self;
  final $Res Function(CafeDayTime) _then;

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
    return _then(_self.copyWith(
      day: null == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      openingTime: null == openingTime
          ? _self.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      closingTime: null == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CafeDayTime implements CafeDayTime {
  const _CafeDayTime(
      {required this.day,
      @TimeOfDayConverter() required this.openingTime,
      @TimeOfDayConverter() required this.closingTime,
      @JsonKey(name: 'is_active') this.isActive = 1});
  factory _CafeDayTime.fromJson(Map<String, dynamic> json) =>
      _$CafeDayTimeFromJson(json);

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

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CafeDayTimeCopyWith<_CafeDayTime> get copyWith =>
      __$CafeDayTimeCopyWithImpl<_CafeDayTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CafeDayTimeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CafeDayTime &&
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

  @override
  String toString() {
    return 'CafeDayTime(day: $day, openingTime: $openingTime, closingTime: $closingTime, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class _$CafeDayTimeCopyWith<$Res>
    implements $CafeDayTimeCopyWith<$Res> {
  factory _$CafeDayTimeCopyWith(
          _CafeDayTime value, $Res Function(_CafeDayTime) _then) =
      __$CafeDayTimeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String day,
      @TimeOfDayConverter() TimeOfDay openingTime,
      @TimeOfDayConverter() TimeOfDay closingTime,
      @JsonKey(name: 'is_active') int isActive});
}

/// @nodoc
class __$CafeDayTimeCopyWithImpl<$Res> implements _$CafeDayTimeCopyWith<$Res> {
  __$CafeDayTimeCopyWithImpl(this._self, this._then);

  final _CafeDayTime _self;
  final $Res Function(_CafeDayTime) _then;

  /// Create a copy of CafeDayTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? day = null,
    Object? openingTime = null,
    Object? closingTime = null,
    Object? isActive = null,
  }) {
    return _then(_CafeDayTime(
      day: null == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      openingTime: null == openingTime
          ? _self.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      closingTime: null == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
