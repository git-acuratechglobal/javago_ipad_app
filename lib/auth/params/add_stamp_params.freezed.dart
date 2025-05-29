// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_stamp_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddStampParams {
  @JsonKey(name: 'stamp_color')
  String get stampColor;
  @JsonKey(name: 'stamp_no')
  int get stampNo;
  @JsonKey(name: 'discount_type')
  String get discountType;
  int get discount;
  @JsonKey(name: 'min_order_value')
  double get minOrderValue;
  @JsonKey(name: 'offer_text')
  String get offerText;
  @JsonKey(name: 'stamp_applicable_to_categories')
  List<String> get stampApplicableToCategories;
  @JsonKey(name: 'exclude_items')
  List<String> get excludeItems;

  /// Create a copy of AddStampParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddStampParamsCopyWith<AddStampParams> get copyWith =>
      _$AddStampParamsCopyWithImpl<AddStampParams>(
          this as AddStampParams, _$identity);

  /// Serializes this AddStampParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddStampParams &&
            (identical(other.stampColor, stampColor) ||
                other.stampColor == stampColor) &&
            (identical(other.stampNo, stampNo) || other.stampNo == stampNo) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.offerText, offerText) ||
                other.offerText == offerText) &&
            const DeepCollectionEquality().equals(
                other.stampApplicableToCategories,
                stampApplicableToCategories) &&
            const DeepCollectionEquality()
                .equals(other.excludeItems, excludeItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stampColor,
      stampNo,
      discountType,
      discount,
      minOrderValue,
      offerText,
      const DeepCollectionEquality().hash(stampApplicableToCategories),
      const DeepCollectionEquality().hash(excludeItems));

  @override
  String toString() {
    return 'AddStampParams(stampColor: $stampColor, stampNo: $stampNo, discountType: $discountType, discount: $discount, minOrderValue: $minOrderValue, offerText: $offerText, stampApplicableToCategories: $stampApplicableToCategories, excludeItems: $excludeItems)';
  }
}

/// @nodoc
abstract mixin class $AddStampParamsCopyWith<$Res> {
  factory $AddStampParamsCopyWith(
          AddStampParams value, $Res Function(AddStampParams) _then) =
      _$AddStampParamsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'stamp_color') String stampColor,
      @JsonKey(name: 'stamp_no') int stampNo,
      @JsonKey(name: 'discount_type') String discountType,
      int discount,
      @JsonKey(name: 'min_order_value') double minOrderValue,
      @JsonKey(name: 'offer_text') String offerText,
      @JsonKey(name: 'stamp_applicable_to_categories')
      List<String> stampApplicableToCategories,
      @JsonKey(name: 'exclude_items') List<String> excludeItems});
}

/// @nodoc
class _$AddStampParamsCopyWithImpl<$Res>
    implements $AddStampParamsCopyWith<$Res> {
  _$AddStampParamsCopyWithImpl(this._self, this._then);

  final AddStampParams _self;
  final $Res Function(AddStampParams) _then;

  /// Create a copy of AddStampParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stampColor = null,
    Object? stampNo = null,
    Object? discountType = null,
    Object? discount = null,
    Object? minOrderValue = null,
    Object? offerText = null,
    Object? stampApplicableToCategories = null,
    Object? excludeItems = null,
  }) {
    return _then(_self.copyWith(
      stampColor: null == stampColor
          ? _self.stampColor
          : stampColor // ignore: cast_nullable_to_non_nullable
              as String,
      stampNo: null == stampNo
          ? _self.stampNo
          : stampNo // ignore: cast_nullable_to_non_nullable
              as int,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      offerText: null == offerText
          ? _self.offerText
          : offerText // ignore: cast_nullable_to_non_nullable
              as String,
      stampApplicableToCategories: null == stampApplicableToCategories
          ? _self.stampApplicableToCategories
          : stampApplicableToCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      excludeItems: null == excludeItems
          ? _self.excludeItems
          : excludeItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddStampParams implements AddStampParams {
  const _AddStampParams(
      {@JsonKey(name: 'stamp_color') required this.stampColor,
      @JsonKey(name: 'stamp_no') required this.stampNo,
      @JsonKey(name: 'discount_type') required this.discountType,
      required this.discount,
      @JsonKey(name: 'min_order_value') required this.minOrderValue,
      @JsonKey(name: 'offer_text') required this.offerText,
      @JsonKey(name: 'stamp_applicable_to_categories')
      required final List<String> stampApplicableToCategories,
      @JsonKey(name: 'exclude_items') required final List<String> excludeItems})
      : _stampApplicableToCategories = stampApplicableToCategories,
        _excludeItems = excludeItems;
  factory _AddStampParams.fromJson(Map<String, dynamic> json) =>
      _$AddStampParamsFromJson(json);

  @override
  @JsonKey(name: 'stamp_color')
  final String stampColor;
  @override
  @JsonKey(name: 'stamp_no')
  final int stampNo;
  @override
  @JsonKey(name: 'discount_type')
  final String discountType;
  @override
  final int discount;
  @override
  @JsonKey(name: 'min_order_value')
  final double minOrderValue;
  @override
  @JsonKey(name: 'offer_text')
  final String offerText;
  final List<String> _stampApplicableToCategories;
  @override
  @JsonKey(name: 'stamp_applicable_to_categories')
  List<String> get stampApplicableToCategories {
    if (_stampApplicableToCategories is EqualUnmodifiableListView)
      return _stampApplicableToCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stampApplicableToCategories);
  }

  final List<String> _excludeItems;
  @override
  @JsonKey(name: 'exclude_items')
  List<String> get excludeItems {
    if (_excludeItems is EqualUnmodifiableListView) return _excludeItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludeItems);
  }

  /// Create a copy of AddStampParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddStampParamsCopyWith<_AddStampParams> get copyWith =>
      __$AddStampParamsCopyWithImpl<_AddStampParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddStampParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddStampParams &&
            (identical(other.stampColor, stampColor) ||
                other.stampColor == stampColor) &&
            (identical(other.stampNo, stampNo) || other.stampNo == stampNo) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.offerText, offerText) ||
                other.offerText == offerText) &&
            const DeepCollectionEquality().equals(
                other._stampApplicableToCategories,
                _stampApplicableToCategories) &&
            const DeepCollectionEquality()
                .equals(other._excludeItems, _excludeItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stampColor,
      stampNo,
      discountType,
      discount,
      minOrderValue,
      offerText,
      const DeepCollectionEquality().hash(_stampApplicableToCategories),
      const DeepCollectionEquality().hash(_excludeItems));

  @override
  String toString() {
    return 'AddStampParams(stampColor: $stampColor, stampNo: $stampNo, discountType: $discountType, discount: $discount, minOrderValue: $minOrderValue, offerText: $offerText, stampApplicableToCategories: $stampApplicableToCategories, excludeItems: $excludeItems)';
  }
}

/// @nodoc
abstract mixin class _$AddStampParamsCopyWith<$Res>
    implements $AddStampParamsCopyWith<$Res> {
  factory _$AddStampParamsCopyWith(
          _AddStampParams value, $Res Function(_AddStampParams) _then) =
      __$AddStampParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stamp_color') String stampColor,
      @JsonKey(name: 'stamp_no') int stampNo,
      @JsonKey(name: 'discount_type') String discountType,
      int discount,
      @JsonKey(name: 'min_order_value') double minOrderValue,
      @JsonKey(name: 'offer_text') String offerText,
      @JsonKey(name: 'stamp_applicable_to_categories')
      List<String> stampApplicableToCategories,
      @JsonKey(name: 'exclude_items') List<String> excludeItems});
}

/// @nodoc
class __$AddStampParamsCopyWithImpl<$Res>
    implements _$AddStampParamsCopyWith<$Res> {
  __$AddStampParamsCopyWithImpl(this._self, this._then);

  final _AddStampParams _self;
  final $Res Function(_AddStampParams) _then;

  /// Create a copy of AddStampParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stampColor = null,
    Object? stampNo = null,
    Object? discountType = null,
    Object? discount = null,
    Object? minOrderValue = null,
    Object? offerText = null,
    Object? stampApplicableToCategories = null,
    Object? excludeItems = null,
  }) {
    return _then(_AddStampParams(
      stampColor: null == stampColor
          ? _self.stampColor
          : stampColor // ignore: cast_nullable_to_non_nullable
              as String,
      stampNo: null == stampNo
          ? _self.stampNo
          : stampNo // ignore: cast_nullable_to_non_nullable
              as int,
      discountType: null == discountType
          ? _self.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      minOrderValue: null == minOrderValue
          ? _self.minOrderValue
          : minOrderValue // ignore: cast_nullable_to_non_nullable
              as double,
      offerText: null == offerText
          ? _self.offerText
          : offerText // ignore: cast_nullable_to_non_nullable
              as String,
      stampApplicableToCategories: null == stampApplicableToCategories
          ? _self._stampApplicableToCategories
          : stampApplicableToCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      excludeItems: null == excludeItems
          ? _self._excludeItems
          : excludeItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
