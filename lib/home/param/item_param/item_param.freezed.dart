// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemParam {
  String get itemName;
  int get itemCategoryId;
  int get itemImageId;
  String get itemDescription;
  int get itemTypeId;
  List<ItemSize> get item;
  List<SelectedOption> get selectedOptions;
  List<AddonItem> get addonItem;

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemParamCopyWith<ItemParam> get copyWith =>
      _$ItemParamCopyWithImpl<ItemParam>(this as ItemParam, _$identity);

  /// Serializes this ItemParam to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemParam &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemCategoryId, itemCategoryId) ||
                other.itemCategoryId == itemCategoryId) &&
            (identical(other.itemImageId, itemImageId) ||
                other.itemImageId == itemImageId) &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            (identical(other.itemTypeId, itemTypeId) ||
                other.itemTypeId == itemTypeId) &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.selectedOptions, selectedOptions) &&
            const DeepCollectionEquality().equals(other.addonItem, addonItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemName,
      itemCategoryId,
      itemImageId,
      itemDescription,
      itemTypeId,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(selectedOptions),
      const DeepCollectionEquality().hash(addonItem));

  @override
  String toString() {
    return 'ItemParam(itemName: $itemName, itemCategoryId: $itemCategoryId, itemImageId: $itemImageId, itemDescription: $itemDescription, itemTypeId: $itemTypeId, item: $item, selectedOptions: $selectedOptions, addonItem: $addonItem)';
  }
}

/// @nodoc
abstract mixin class $ItemParamCopyWith<$Res> {
  factory $ItemParamCopyWith(ItemParam value, $Res Function(ItemParam) _then) =
      _$ItemParamCopyWithImpl;
  @useResult
  $Res call(
      {String itemName,
      int itemCategoryId,
      int itemImageId,
      String itemDescription,
      int itemTypeId,
      List<ItemSize> item,
      List<SelectedOption> selectedOptions,
      List<AddonItem> addonItem});
}

/// @nodoc
class _$ItemParamCopyWithImpl<$Res> implements $ItemParamCopyWith<$Res> {
  _$ItemParamCopyWithImpl(this._self, this._then);

  final ItemParam _self;
  final $Res Function(ItemParam) _then;

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? itemCategoryId = null,
    Object? itemImageId = null,
    Object? itemDescription = null,
    Object? itemTypeId = null,
    Object? item = null,
    Object? selectedOptions = null,
    Object? addonItem = null,
  }) {
    return _then(_self.copyWith(
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemCategoryId: null == itemCategoryId
          ? _self.itemCategoryId
          : itemCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      itemImageId: null == itemImageId
          ? _self.itemImageId
          : itemImageId // ignore: cast_nullable_to_non_nullable
              as int,
      itemDescription: null == itemDescription
          ? _self.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemTypeId: null == itemTypeId
          ? _self.itemTypeId
          : itemTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ItemSize>,
      selectedOptions: null == selectedOptions
          ? _self.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<SelectedOption>,
      addonItem: null == addonItem
          ? _self.addonItem
          : addonItem // ignore: cast_nullable_to_non_nullable
              as List<AddonItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ItemParam implements ItemParam {
  const _ItemParam(
      {required this.itemName,
      required this.itemCategoryId,
      required this.itemImageId,
      required this.itemDescription,
      required this.itemTypeId,
      required final List<ItemSize> item,
      required final List<SelectedOption> selectedOptions,
      required final List<AddonItem> addonItem})
      : _item = item,
        _selectedOptions = selectedOptions,
        _addonItem = addonItem;
  factory _ItemParam.fromJson(Map<String, dynamic> json) =>
      _$ItemParamFromJson(json);

  @override
  final String itemName;
  @override
  final int itemCategoryId;
  @override
  final int itemImageId;
  @override
  final String itemDescription;
  @override
  final int itemTypeId;
  final List<ItemSize> _item;
  @override
  List<ItemSize> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  final List<SelectedOption> _selectedOptions;
  @override
  List<SelectedOption> get selectedOptions {
    if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedOptions);
  }

  final List<AddonItem> _addonItem;
  @override
  List<AddonItem> get addonItem {
    if (_addonItem is EqualUnmodifiableListView) return _addonItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addonItem);
  }

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemParamCopyWith<_ItemParam> get copyWith =>
      __$ItemParamCopyWithImpl<_ItemParam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemParamToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemParam &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemCategoryId, itemCategoryId) ||
                other.itemCategoryId == itemCategoryId) &&
            (identical(other.itemImageId, itemImageId) ||
                other.itemImageId == itemImageId) &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            (identical(other.itemTypeId, itemTypeId) ||
                other.itemTypeId == itemTypeId) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            const DeepCollectionEquality()
                .equals(other._selectedOptions, _selectedOptions) &&
            const DeepCollectionEquality()
                .equals(other._addonItem, _addonItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemName,
      itemCategoryId,
      itemImageId,
      itemDescription,
      itemTypeId,
      const DeepCollectionEquality().hash(_item),
      const DeepCollectionEquality().hash(_selectedOptions),
      const DeepCollectionEquality().hash(_addonItem));

  @override
  String toString() {
    return 'ItemParam(itemName: $itemName, itemCategoryId: $itemCategoryId, itemImageId: $itemImageId, itemDescription: $itemDescription, itemTypeId: $itemTypeId, item: $item, selectedOptions: $selectedOptions, addonItem: $addonItem)';
  }
}

/// @nodoc
abstract mixin class _$ItemParamCopyWith<$Res>
    implements $ItemParamCopyWith<$Res> {
  factory _$ItemParamCopyWith(
          _ItemParam value, $Res Function(_ItemParam) _then) =
      __$ItemParamCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemName,
      int itemCategoryId,
      int itemImageId,
      String itemDescription,
      int itemTypeId,
      List<ItemSize> item,
      List<SelectedOption> selectedOptions,
      List<AddonItem> addonItem});
}

/// @nodoc
class __$ItemParamCopyWithImpl<$Res> implements _$ItemParamCopyWith<$Res> {
  __$ItemParamCopyWithImpl(this._self, this._then);

  final _ItemParam _self;
  final $Res Function(_ItemParam) _then;

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemName = null,
    Object? itemCategoryId = null,
    Object? itemImageId = null,
    Object? itemDescription = null,
    Object? itemTypeId = null,
    Object? item = null,
    Object? selectedOptions = null,
    Object? addonItem = null,
  }) {
    return _then(_ItemParam(
      itemName: null == itemName
          ? _self.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemCategoryId: null == itemCategoryId
          ? _self.itemCategoryId
          : itemCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      itemImageId: null == itemImageId
          ? _self.itemImageId
          : itemImageId // ignore: cast_nullable_to_non_nullable
              as int,
      itemDescription: null == itemDescription
          ? _self.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemTypeId: null == itemTypeId
          ? _self.itemTypeId
          : itemTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _self._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ItemSize>,
      selectedOptions: null == selectedOptions
          ? _self._selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<SelectedOption>,
      addonItem: null == addonItem
          ? _self._addonItem
          : addonItem // ignore: cast_nullable_to_non_nullable
              as List<AddonItem>,
    ));
  }
}

/// @nodoc
mixin _$ItemSize {
  int get itemSizeId;
  double get itemPrice;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemSizeCopyWith<ItemSize> get copyWith =>
      _$ItemSizeCopyWithImpl<ItemSize>(this as ItemSize, _$identity);

  /// Serializes this ItemSize to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemSize &&
            (identical(other.itemSizeId, itemSizeId) ||
                other.itemSizeId == itemSizeId) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemSizeId, itemPrice);

  @override
  String toString() {
    return 'ItemSize(itemSizeId: $itemSizeId, itemPrice: $itemPrice)';
  }
}

/// @nodoc
abstract mixin class $ItemSizeCopyWith<$Res> {
  factory $ItemSizeCopyWith(ItemSize value, $Res Function(ItemSize) _then) =
      _$ItemSizeCopyWithImpl;
  @useResult
  $Res call({int itemSizeId, double itemPrice});
}

/// @nodoc
class _$ItemSizeCopyWithImpl<$Res> implements $ItemSizeCopyWith<$Res> {
  _$ItemSizeCopyWithImpl(this._self, this._then);

  final ItemSize _self;
  final $Res Function(ItemSize) _then;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemSizeId = null,
    Object? itemPrice = null,
  }) {
    return _then(_self.copyWith(
      itemSizeId: null == itemSizeId
          ? _self.itemSizeId
          : itemSizeId // ignore: cast_nullable_to_non_nullable
              as int,
      itemPrice: null == itemPrice
          ? _self.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ItemSize implements ItemSize {
  const _ItemSize({required this.itemSizeId, required this.itemPrice});
  factory _ItemSize.fromJson(Map<String, dynamic> json) =>
      _$ItemSizeFromJson(json);

  @override
  final int itemSizeId;
  @override
  final double itemPrice;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemSizeCopyWith<_ItemSize> get copyWith =>
      __$ItemSizeCopyWithImpl<_ItemSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItemSizeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemSize &&
            (identical(other.itemSizeId, itemSizeId) ||
                other.itemSizeId == itemSizeId) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemSizeId, itemPrice);

  @override
  String toString() {
    return 'ItemSize(itemSizeId: $itemSizeId, itemPrice: $itemPrice)';
  }
}

/// @nodoc
abstract mixin class _$ItemSizeCopyWith<$Res>
    implements $ItemSizeCopyWith<$Res> {
  factory _$ItemSizeCopyWith(_ItemSize value, $Res Function(_ItemSize) _then) =
      __$ItemSizeCopyWithImpl;
  @override
  @useResult
  $Res call({int itemSizeId, double itemPrice});
}

/// @nodoc
class __$ItemSizeCopyWithImpl<$Res> implements _$ItemSizeCopyWith<$Res> {
  __$ItemSizeCopyWithImpl(this._self, this._then);

  final _ItemSize _self;
  final $Res Function(_ItemSize) _then;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemSizeId = null,
    Object? itemPrice = null,
  }) {
    return _then(_ItemSize(
      itemSizeId: null == itemSizeId
          ? _self.itemSizeId
          : itemSizeId // ignore: cast_nullable_to_non_nullable
              as int,
      itemPrice: null == itemPrice
          ? _self.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$SelectedOption {
  String get optionId;
  double get price;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedOptionCopyWith<SelectedOption> get copyWith =>
      _$SelectedOptionCopyWithImpl<SelectedOption>(
          this as SelectedOption, _$identity);

  /// Serializes this SelectedOption to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedOption &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, price);

  @override
  String toString() {
    return 'SelectedOption(optionId: $optionId, price: $price)';
  }
}

/// @nodoc
abstract mixin class $SelectedOptionCopyWith<$Res> {
  factory $SelectedOptionCopyWith(
          SelectedOption value, $Res Function(SelectedOption) _then) =
      _$SelectedOptionCopyWithImpl;
  @useResult
  $Res call({String optionId, double price});
}

/// @nodoc
class _$SelectedOptionCopyWithImpl<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  _$SelectedOptionCopyWithImpl(this._self, this._then);

  final SelectedOption _self;
  final $Res Function(SelectedOption) _then;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      optionId: null == optionId
          ? _self.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SelectedOption implements SelectedOption {
  const _SelectedOption({required this.optionId, required this.price});
  factory _SelectedOption.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionFromJson(json);

  @override
  final String optionId;
  @override
  final double price;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectedOptionCopyWith<_SelectedOption> get copyWith =>
      __$SelectedOptionCopyWithImpl<_SelectedOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectedOptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedOption &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, price);

  @override
  String toString() {
    return 'SelectedOption(optionId: $optionId, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$SelectedOptionCopyWith<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  factory _$SelectedOptionCopyWith(
          _SelectedOption value, $Res Function(_SelectedOption) _then) =
      __$SelectedOptionCopyWithImpl;
  @override
  @useResult
  $Res call({String optionId, double price});
}

/// @nodoc
class __$SelectedOptionCopyWithImpl<$Res>
    implements _$SelectedOptionCopyWith<$Res> {
  __$SelectedOptionCopyWithImpl(this._self, this._then);

  final _SelectedOption _self;
  final $Res Function(_SelectedOption) _then;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? optionId = null,
    Object? price = null,
  }) {
    return _then(_SelectedOption(
      optionId: null == optionId
          ? _self.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$AddonItem {
  int get addonItemId;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddonItemCopyWith<AddonItem> get copyWith =>
      _$AddonItemCopyWithImpl<AddonItem>(this as AddonItem, _$identity);

  /// Serializes this AddonItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddonItem &&
            (identical(other.addonItemId, addonItemId) ||
                other.addonItemId == addonItemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addonItemId);

  @override
  String toString() {
    return 'AddonItem(addonItemId: $addonItemId)';
  }
}

/// @nodoc
abstract mixin class $AddonItemCopyWith<$Res> {
  factory $AddonItemCopyWith(AddonItem value, $Res Function(AddonItem) _then) =
      _$AddonItemCopyWithImpl;
  @useResult
  $Res call({int addonItemId});
}

/// @nodoc
class _$AddonItemCopyWithImpl<$Res> implements $AddonItemCopyWith<$Res> {
  _$AddonItemCopyWithImpl(this._self, this._then);

  final AddonItem _self;
  final $Res Function(AddonItem) _then;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonItemId = null,
  }) {
    return _then(_self.copyWith(
      addonItemId: null == addonItemId
          ? _self.addonItemId
          : addonItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddonItem implements AddonItem {
  const _AddonItem({required this.addonItemId});
  factory _AddonItem.fromJson(Map<String, dynamic> json) =>
      _$AddonItemFromJson(json);

  @override
  final int addonItemId;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddonItemCopyWith<_AddonItem> get copyWith =>
      __$AddonItemCopyWithImpl<_AddonItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddonItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddonItem &&
            (identical(other.addonItemId, addonItemId) ||
                other.addonItemId == addonItemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addonItemId);

  @override
  String toString() {
    return 'AddonItem(addonItemId: $addonItemId)';
  }
}

/// @nodoc
abstract mixin class _$AddonItemCopyWith<$Res>
    implements $AddonItemCopyWith<$Res> {
  factory _$AddonItemCopyWith(
          _AddonItem value, $Res Function(_AddonItem) _then) =
      __$AddonItemCopyWithImpl;
  @override
  @useResult
  $Res call({int addonItemId});
}

/// @nodoc
class __$AddonItemCopyWithImpl<$Res> implements _$AddonItemCopyWith<$Res> {
  __$AddonItemCopyWithImpl(this._self, this._then);

  final _AddonItem _self;
  final $Res Function(_AddonItem) _then;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addonItemId = null,
  }) {
    return _then(_AddonItem(
      addonItemId: null == addonItemId
          ? _self.addonItemId
          : addonItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
