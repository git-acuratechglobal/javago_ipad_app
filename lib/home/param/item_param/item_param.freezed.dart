// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemParam _$ItemParamFromJson(Map<String, dynamic> json) {
  return _ItemParam.fromJson(json);
}

/// @nodoc
mixin _$ItemParam {
  String get itemName => throw _privateConstructorUsedError;
  int get itemCategoryId => throw _privateConstructorUsedError;
  String get itemDescription => throw _privateConstructorUsedError;
  int get itemTypeId => throw _privateConstructorUsedError;
  List<ItemSize> get item => throw _privateConstructorUsedError;
  List<SelectedOption> get selectedOptions =>
      throw _privateConstructorUsedError;
  List<AddonItem> get addonItem => throw _privateConstructorUsedError;
  int? get cafe_menu_id => throw _privateConstructorUsedError;

  /// Serializes this ItemParam to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemParamCopyWith<ItemParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemParamCopyWith<$Res> {
  factory $ItemParamCopyWith(ItemParam value, $Res Function(ItemParam) then) =
      _$ItemParamCopyWithImpl<$Res, ItemParam>;
  @useResult
  $Res call(
      {String itemName,
      int itemCategoryId,
      String itemDescription,
      int itemTypeId,
      List<ItemSize> item,
      List<SelectedOption> selectedOptions,
      List<AddonItem> addonItem,
      int? cafe_menu_id});
}

/// @nodoc
class _$ItemParamCopyWithImpl<$Res, $Val extends ItemParam>
    implements $ItemParamCopyWith<$Res> {
  _$ItemParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? itemCategoryId = null,
    Object? itemDescription = null,
    Object? itemTypeId = null,
    Object? item = null,
    Object? selectedOptions = null,
    Object? addonItem = null,
    Object? cafe_menu_id = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemCategoryId: null == itemCategoryId
          ? _value.itemCategoryId
          : itemCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      itemDescription: null == itemDescription
          ? _value.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemTypeId: null == itemTypeId
          ? _value.itemTypeId
          : itemTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ItemSize>,
      selectedOptions: null == selectedOptions
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<SelectedOption>,
      addonItem: null == addonItem
          ? _value.addonItem
          : addonItem // ignore: cast_nullable_to_non_nullable
              as List<AddonItem>,
      cafe_menu_id: freezed == cafe_menu_id
          ? _value.cafe_menu_id
          : cafe_menu_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemParamImplCopyWith<$Res>
    implements $ItemParamCopyWith<$Res> {
  factory _$$ItemParamImplCopyWith(
          _$ItemParamImpl value, $Res Function(_$ItemParamImpl) then) =
      __$$ItemParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemName,
      int itemCategoryId,
      String itemDescription,
      int itemTypeId,
      List<ItemSize> item,
      List<SelectedOption> selectedOptions,
      List<AddonItem> addonItem,
      int? cafe_menu_id});
}

/// @nodoc
class __$$ItemParamImplCopyWithImpl<$Res>
    extends _$ItemParamCopyWithImpl<$Res, _$ItemParamImpl>
    implements _$$ItemParamImplCopyWith<$Res> {
  __$$ItemParamImplCopyWithImpl(
      _$ItemParamImpl _value, $Res Function(_$ItemParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? itemCategoryId = null,
    Object? itemDescription = null,
    Object? itemTypeId = null,
    Object? item = null,
    Object? selectedOptions = null,
    Object? addonItem = null,
    Object? cafe_menu_id = freezed,
  }) {
    return _then(_$ItemParamImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemCategoryId: null == itemCategoryId
          ? _value.itemCategoryId
          : itemCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      itemDescription: null == itemDescription
          ? _value.itemDescription
          : itemDescription // ignore: cast_nullable_to_non_nullable
              as String,
      itemTypeId: null == itemTypeId
          ? _value.itemTypeId
          : itemTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ItemSize>,
      selectedOptions: null == selectedOptions
          ? _value._selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<SelectedOption>,
      addonItem: null == addonItem
          ? _value._addonItem
          : addonItem // ignore: cast_nullable_to_non_nullable
              as List<AddonItem>,
      cafe_menu_id: freezed == cafe_menu_id
          ? _value.cafe_menu_id
          : cafe_menu_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemParamImpl implements _ItemParam {
  const _$ItemParamImpl(
      {required this.itemName,
      required this.itemCategoryId,
      required this.itemDescription,
      required this.itemTypeId,
      required final List<ItemSize> item,
      required final List<SelectedOption> selectedOptions,
      required final List<AddonItem> addonItem,
      this.cafe_menu_id})
      : _item = item,
        _selectedOptions = selectedOptions,
        _addonItem = addonItem;

  factory _$ItemParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemParamImplFromJson(json);

  @override
  final String itemName;
  @override
  final int itemCategoryId;
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

  @override
  final int? cafe_menu_id;

  @override
  String toString() {
    return 'ItemParam(itemName: $itemName, itemCategoryId: $itemCategoryId, itemDescription: $itemDescription, itemTypeId: $itemTypeId, item: $item, selectedOptions: $selectedOptions, addonItem: $addonItem, cafe_menu_id: $cafe_menu_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemParamImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemCategoryId, itemCategoryId) ||
                other.itemCategoryId == itemCategoryId) &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            (identical(other.itemTypeId, itemTypeId) ||
                other.itemTypeId == itemTypeId) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            const DeepCollectionEquality()
                .equals(other._selectedOptions, _selectedOptions) &&
            const DeepCollectionEquality()
                .equals(other._addonItem, _addonItem) &&
            (identical(other.cafe_menu_id, cafe_menu_id) ||
                other.cafe_menu_id == cafe_menu_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemName,
      itemCategoryId,
      itemDescription,
      itemTypeId,
      const DeepCollectionEquality().hash(_item),
      const DeepCollectionEquality().hash(_selectedOptions),
      const DeepCollectionEquality().hash(_addonItem),
      cafe_menu_id);

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemParamImplCopyWith<_$ItemParamImpl> get copyWith =>
      __$$ItemParamImplCopyWithImpl<_$ItemParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemParamImplToJson(
      this,
    );
  }
}

abstract class _ItemParam implements ItemParam {
  const factory _ItemParam(
      {required final String itemName,
      required final int itemCategoryId,
      required final String itemDescription,
      required final int itemTypeId,
      required final List<ItemSize> item,
      required final List<SelectedOption> selectedOptions,
      required final List<AddonItem> addonItem,
      final int? cafe_menu_id}) = _$ItemParamImpl;

  factory _ItemParam.fromJson(Map<String, dynamic> json) =
      _$ItemParamImpl.fromJson;

  @override
  String get itemName;
  @override
  int get itemCategoryId;
  @override
  String get itemDescription;
  @override
  int get itemTypeId;
  @override
  List<ItemSize> get item;
  @override
  List<SelectedOption> get selectedOptions;
  @override
  List<AddonItem> get addonItem;
  @override
  int? get cafe_menu_id;

  /// Create a copy of ItemParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemParamImplCopyWith<_$ItemParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemSize _$ItemSizeFromJson(Map<String, dynamic> json) {
  return _ItemSize.fromJson(json);
}

/// @nodoc
mixin _$ItemSize {
  int get itemSizeId => throw _privateConstructorUsedError;
  double get itemPrice => throw _privateConstructorUsedError;

  /// Serializes this ItemSize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemSizeCopyWith<ItemSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemSizeCopyWith<$Res> {
  factory $ItemSizeCopyWith(ItemSize value, $Res Function(ItemSize) then) =
      _$ItemSizeCopyWithImpl<$Res, ItemSize>;
  @useResult
  $Res call({int itemSizeId, double itemPrice});
}

/// @nodoc
class _$ItemSizeCopyWithImpl<$Res, $Val extends ItemSize>
    implements $ItemSizeCopyWith<$Res> {
  _$ItemSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemSizeId = null,
    Object? itemPrice = null,
  }) {
    return _then(_value.copyWith(
      itemSizeId: null == itemSizeId
          ? _value.itemSizeId
          : itemSizeId // ignore: cast_nullable_to_non_nullable
              as int,
      itemPrice: null == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemSizeImplCopyWith<$Res>
    implements $ItemSizeCopyWith<$Res> {
  factory _$$ItemSizeImplCopyWith(
          _$ItemSizeImpl value, $Res Function(_$ItemSizeImpl) then) =
      __$$ItemSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int itemSizeId, double itemPrice});
}

/// @nodoc
class __$$ItemSizeImplCopyWithImpl<$Res>
    extends _$ItemSizeCopyWithImpl<$Res, _$ItemSizeImpl>
    implements _$$ItemSizeImplCopyWith<$Res> {
  __$$ItemSizeImplCopyWithImpl(
      _$ItemSizeImpl _value, $Res Function(_$ItemSizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemSizeId = null,
    Object? itemPrice = null,
  }) {
    return _then(_$ItemSizeImpl(
      itemSizeId: null == itemSizeId
          ? _value.itemSizeId
          : itemSizeId // ignore: cast_nullable_to_non_nullable
              as int,
      itemPrice: null == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemSizeImpl implements _ItemSize {
  const _$ItemSizeImpl({required this.itemSizeId, required this.itemPrice});

  factory _$ItemSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemSizeImplFromJson(json);

  @override
  final int itemSizeId;
  @override
  final double itemPrice;

  @override
  String toString() {
    return 'ItemSize(itemSizeId: $itemSizeId, itemPrice: $itemPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemSizeImpl &&
            (identical(other.itemSizeId, itemSizeId) ||
                other.itemSizeId == itemSizeId) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemSizeId, itemPrice);

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemSizeImplCopyWith<_$ItemSizeImpl> get copyWith =>
      __$$ItemSizeImplCopyWithImpl<_$ItemSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemSizeImplToJson(
      this,
    );
  }
}

abstract class _ItemSize implements ItemSize {
  const factory _ItemSize(
      {required final int itemSizeId,
      required final double itemPrice}) = _$ItemSizeImpl;

  factory _ItemSize.fromJson(Map<String, dynamic> json) =
      _$ItemSizeImpl.fromJson;

  @override
  int get itemSizeId;
  @override
  double get itemPrice;

  /// Create a copy of ItemSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemSizeImplCopyWith<_$ItemSizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelectedOption _$SelectedOptionFromJson(Map<String, dynamic> json) {
  return _SelectedOption.fromJson(json);
}

/// @nodoc
mixin _$SelectedOption {
  String get optionId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this SelectedOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectedOptionCopyWith<SelectedOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedOptionCopyWith<$Res> {
  factory $SelectedOptionCopyWith(
          SelectedOption value, $Res Function(SelectedOption) then) =
      _$SelectedOptionCopyWithImpl<$Res, SelectedOption>;
  @useResult
  $Res call({String optionId, double price});
}

/// @nodoc
class _$SelectedOptionCopyWithImpl<$Res, $Val extends SelectedOption>
    implements $SelectedOptionCopyWith<$Res> {
  _$SelectedOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedOptionImplCopyWith<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  factory _$$SelectedOptionImplCopyWith(_$SelectedOptionImpl value,
          $Res Function(_$SelectedOptionImpl) then) =
      __$$SelectedOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String optionId, double price});
}

/// @nodoc
class __$$SelectedOptionImplCopyWithImpl<$Res>
    extends _$SelectedOptionCopyWithImpl<$Res, _$SelectedOptionImpl>
    implements _$$SelectedOptionImplCopyWith<$Res> {
  __$$SelectedOptionImplCopyWithImpl(
      _$SelectedOptionImpl _value, $Res Function(_$SelectedOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = null,
    Object? price = null,
  }) {
    return _then(_$SelectedOptionImpl(
      optionId: null == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectedOptionImpl implements _SelectedOption {
  const _$SelectedOptionImpl({required this.optionId, required this.price});

  factory _$SelectedOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectedOptionImplFromJson(json);

  @override
  final String optionId;
  @override
  final double price;

  @override
  String toString() {
    return 'SelectedOption(optionId: $optionId, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedOptionImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionId, price);

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedOptionImplCopyWith<_$SelectedOptionImpl> get copyWith =>
      __$$SelectedOptionImplCopyWithImpl<_$SelectedOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectedOptionImplToJson(
      this,
    );
  }
}

abstract class _SelectedOption implements SelectedOption {
  const factory _SelectedOption(
      {required final String optionId,
      required final double price}) = _$SelectedOptionImpl;

  factory _SelectedOption.fromJson(Map<String, dynamic> json) =
      _$SelectedOptionImpl.fromJson;

  @override
  String get optionId;
  @override
  double get price;

  /// Create a copy of SelectedOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedOptionImplCopyWith<_$SelectedOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddonItem _$AddonItemFromJson(Map<String, dynamic> json) {
  return _AddonItem.fromJson(json);
}

/// @nodoc
mixin _$AddonItem {
  int get addonItemId => throw _privateConstructorUsedError;

  /// Serializes this AddonItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddonItemCopyWith<AddonItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddonItemCopyWith<$Res> {
  factory $AddonItemCopyWith(AddonItem value, $Res Function(AddonItem) then) =
      _$AddonItemCopyWithImpl<$Res, AddonItem>;
  @useResult
  $Res call({int addonItemId});
}

/// @nodoc
class _$AddonItemCopyWithImpl<$Res, $Val extends AddonItem>
    implements $AddonItemCopyWith<$Res> {
  _$AddonItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonItemId = null,
  }) {
    return _then(_value.copyWith(
      addonItemId: null == addonItemId
          ? _value.addonItemId
          : addonItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddonItemImplCopyWith<$Res>
    implements $AddonItemCopyWith<$Res> {
  factory _$$AddonItemImplCopyWith(
          _$AddonItemImpl value, $Res Function(_$AddonItemImpl) then) =
      __$$AddonItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int addonItemId});
}

/// @nodoc
class __$$AddonItemImplCopyWithImpl<$Res>
    extends _$AddonItemCopyWithImpl<$Res, _$AddonItemImpl>
    implements _$$AddonItemImplCopyWith<$Res> {
  __$$AddonItemImplCopyWithImpl(
      _$AddonItemImpl _value, $Res Function(_$AddonItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addonItemId = null,
  }) {
    return _then(_$AddonItemImpl(
      addonItemId: null == addonItemId
          ? _value.addonItemId
          : addonItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddonItemImpl implements _AddonItem {
  const _$AddonItemImpl({required this.addonItemId});

  factory _$AddonItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddonItemImplFromJson(json);

  @override
  final int addonItemId;

  @override
  String toString() {
    return 'AddonItem(addonItemId: $addonItemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddonItemImpl &&
            (identical(other.addonItemId, addonItemId) ||
                other.addonItemId == addonItemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addonItemId);

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddonItemImplCopyWith<_$AddonItemImpl> get copyWith =>
      __$$AddonItemImplCopyWithImpl<_$AddonItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddonItemImplToJson(
      this,
    );
  }
}

abstract class _AddonItem implements AddonItem {
  const factory _AddonItem({required final int addonItemId}) = _$AddonItemImpl;

  factory _AddonItem.fromJson(Map<String, dynamic> json) =
      _$AddonItemImpl.fromJson;

  @override
  int get addonItemId;

  /// Create a copy of AddonItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddonItemImplCopyWith<_$AddonItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
