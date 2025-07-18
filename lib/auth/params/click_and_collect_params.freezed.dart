// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'click_and_collect_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClickAndCollectParams _$ClickAndCollectParamsFromJson(
    Map<String, dynamic> json) {
  return _ClickAndCollectParams.fromJson(json);
}

/// @nodoc
mixin _$ClickAndCollectParams {
  int get click_and_collect => throw _privateConstructorUsedError;
  int get max_orders_click_collect => throw _privateConstructorUsedError;
  List<CafeDayTime> get clickAndCollectTime =>
      throw _privateConstructorUsedError;
  List<CafeClickCollectTiming> get initialCafeTime =>
      throw _privateConstructorUsedError;

  /// Serializes this ClickAndCollectParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClickAndCollectParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClickAndCollectParamsCopyWith<ClickAndCollectParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClickAndCollectParamsCopyWith<$Res> {
  factory $ClickAndCollectParamsCopyWith(ClickAndCollectParams value,
          $Res Function(ClickAndCollectParams) then) =
      _$ClickAndCollectParamsCopyWithImpl<$Res, ClickAndCollectParams>;
  @useResult
  $Res call(
      {int click_and_collect,
      int max_orders_click_collect,
      List<CafeDayTime> clickAndCollectTime,
      List<CafeClickCollectTiming> initialCafeTime});
}

/// @nodoc
class _$ClickAndCollectParamsCopyWithImpl<$Res,
        $Val extends ClickAndCollectParams>
    implements $ClickAndCollectParamsCopyWith<$Res> {
  _$ClickAndCollectParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClickAndCollectParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? click_and_collect = null,
    Object? max_orders_click_collect = null,
    Object? clickAndCollectTime = null,
    Object? initialCafeTime = null,
  }) {
    return _then(_value.copyWith(
      click_and_collect: null == click_and_collect
          ? _value.click_and_collect
          : click_and_collect // ignore: cast_nullable_to_non_nullable
              as int,
      max_orders_click_collect: null == max_orders_click_collect
          ? _value.max_orders_click_collect
          : max_orders_click_collect // ignore: cast_nullable_to_non_nullable
              as int,
      clickAndCollectTime: null == clickAndCollectTime
          ? _value.clickAndCollectTime
          : clickAndCollectTime // ignore: cast_nullable_to_non_nullable
              as List<CafeDayTime>,
      initialCafeTime: null == initialCafeTime
          ? _value.initialCafeTime
          : initialCafeTime // ignore: cast_nullable_to_non_nullable
              as List<CafeClickCollectTiming>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClickAndCollectParamsImplCopyWith<$Res>
    implements $ClickAndCollectParamsCopyWith<$Res> {
  factory _$$ClickAndCollectParamsImplCopyWith(
          _$ClickAndCollectParamsImpl value,
          $Res Function(_$ClickAndCollectParamsImpl) then) =
      __$$ClickAndCollectParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int click_and_collect,
      int max_orders_click_collect,
      List<CafeDayTime> clickAndCollectTime,
      List<CafeClickCollectTiming> initialCafeTime});
}

/// @nodoc
class __$$ClickAndCollectParamsImplCopyWithImpl<$Res>
    extends _$ClickAndCollectParamsCopyWithImpl<$Res,
        _$ClickAndCollectParamsImpl>
    implements _$$ClickAndCollectParamsImplCopyWith<$Res> {
  __$$ClickAndCollectParamsImplCopyWithImpl(_$ClickAndCollectParamsImpl _value,
      $Res Function(_$ClickAndCollectParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClickAndCollectParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? click_and_collect = null,
    Object? max_orders_click_collect = null,
    Object? clickAndCollectTime = null,
    Object? initialCafeTime = null,
  }) {
    return _then(_$ClickAndCollectParamsImpl(
      click_and_collect: null == click_and_collect
          ? _value.click_and_collect
          : click_and_collect // ignore: cast_nullable_to_non_nullable
              as int,
      max_orders_click_collect: null == max_orders_click_collect
          ? _value.max_orders_click_collect
          : max_orders_click_collect // ignore: cast_nullable_to_non_nullable
              as int,
      clickAndCollectTime: null == clickAndCollectTime
          ? _value._clickAndCollectTime
          : clickAndCollectTime // ignore: cast_nullable_to_non_nullable
              as List<CafeDayTime>,
      initialCafeTime: null == initialCafeTime
          ? _value._initialCafeTime
          : initialCafeTime // ignore: cast_nullable_to_non_nullable
              as List<CafeClickCollectTiming>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClickAndCollectParamsImpl implements _ClickAndCollectParams {
  const _$ClickAndCollectParamsImpl(
      {this.click_and_collect = 1,
      this.max_orders_click_collect = 12,
      required final List<CafeDayTime> clickAndCollectTime,
      required final List<CafeClickCollectTiming> initialCafeTime})
      : _clickAndCollectTime = clickAndCollectTime,
        _initialCafeTime = initialCafeTime;

  factory _$ClickAndCollectParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClickAndCollectParamsImplFromJson(json);

  @override
  @JsonKey()
  final int click_and_collect;
  @override
  @JsonKey()
  final int max_orders_click_collect;
  final List<CafeDayTime> _clickAndCollectTime;
  @override
  List<CafeDayTime> get clickAndCollectTime {
    if (_clickAndCollectTime is EqualUnmodifiableListView)
      return _clickAndCollectTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clickAndCollectTime);
  }

  final List<CafeClickCollectTiming> _initialCafeTime;
  @override
  List<CafeClickCollectTiming> get initialCafeTime {
    if (_initialCafeTime is EqualUnmodifiableListView) return _initialCafeTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialCafeTime);
  }

  @override
  String toString() {
    return 'ClickAndCollectParams(click_and_collect: $click_and_collect, max_orders_click_collect: $max_orders_click_collect, clickAndCollectTime: $clickAndCollectTime, initialCafeTime: $initialCafeTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClickAndCollectParamsImpl &&
            (identical(other.click_and_collect, click_and_collect) ||
                other.click_and_collect == click_and_collect) &&
            (identical(
                    other.max_orders_click_collect, max_orders_click_collect) ||
                other.max_orders_click_collect == max_orders_click_collect) &&
            const DeepCollectionEquality()
                .equals(other._clickAndCollectTime, _clickAndCollectTime) &&
            const DeepCollectionEquality()
                .equals(other._initialCafeTime, _initialCafeTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      click_and_collect,
      max_orders_click_collect,
      const DeepCollectionEquality().hash(_clickAndCollectTime),
      const DeepCollectionEquality().hash(_initialCafeTime));

  /// Create a copy of ClickAndCollectParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClickAndCollectParamsImplCopyWith<_$ClickAndCollectParamsImpl>
      get copyWith => __$$ClickAndCollectParamsImplCopyWithImpl<
          _$ClickAndCollectParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClickAndCollectParamsImplToJson(
      this,
    );
  }
}

abstract class _ClickAndCollectParams implements ClickAndCollectParams {
  const factory _ClickAndCollectParams(
          {final int click_and_collect,
          final int max_orders_click_collect,
          required final List<CafeDayTime> clickAndCollectTime,
          required final List<CafeClickCollectTiming> initialCafeTime}) =
      _$ClickAndCollectParamsImpl;

  factory _ClickAndCollectParams.fromJson(Map<String, dynamic> json) =
      _$ClickAndCollectParamsImpl.fromJson;

  @override
  int get click_and_collect;
  @override
  int get max_orders_click_collect;
  @override
  List<CafeDayTime> get clickAndCollectTime;
  @override
  List<CafeClickCollectTiming> get initialCafeTime;

  /// Create a copy of ClickAndCollectParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClickAndCollectParamsImplCopyWith<_$ClickAndCollectParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
