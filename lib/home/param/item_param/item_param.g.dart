// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemParam _$ItemParamFromJson(Map<String, dynamic> json) => _ItemParam(
      itemName: json['itemName'] as String,
      itemCategoryId: (json['itemCategoryId'] as num).toInt(),
      itemImageId: (json['itemImageId'] as num).toInt(),
      itemDescription: json['itemDescription'] as String,
      itemTypeId: (json['itemTypeId'] as num).toInt(),
      item: (json['item'] as List<dynamic>)
          .map((e) => ItemSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedOptions: (json['selectedOptions'] as List<dynamic>)
          .map((e) => SelectedOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      addonItem: (json['addonItem'] as List<dynamic>)
          .map((e) => AddonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemParamToJson(_ItemParam instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemCategoryId': instance.itemCategoryId,
      'itemImageId': instance.itemImageId,
      'itemDescription': instance.itemDescription,
      'itemTypeId': instance.itemTypeId,
      'item': instance.item,
      'selectedOptions': instance.selectedOptions,
      'addonItem': instance.addonItem,
    };

_ItemSize _$ItemSizeFromJson(Map<String, dynamic> json) => _ItemSize(
      itemSizeId: (json['itemSizeId'] as num).toInt(),
      itemPrice: (json['itemPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$ItemSizeToJson(_ItemSize instance) => <String, dynamic>{
      'itemSizeId': instance.itemSizeId,
      'itemPrice': instance.itemPrice,
    };

_SelectedOption _$SelectedOptionFromJson(Map<String, dynamic> json) =>
    _SelectedOption(
      optionId: json['optionId'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$SelectedOptionToJson(_SelectedOption instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'price': instance.price,
    };

_AddonItem _$AddonItemFromJson(Map<String, dynamic> json) => _AddonItem(
      addonItemId: (json['addonItemId'] as num).toInt(),
    );

Map<String, dynamic> _$AddonItemToJson(_AddonItem instance) =>
    <String, dynamic>{
      'addonItemId': instance.addonItemId,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemParamNotifierHash() => r'280055013acffce39b4de4f3e0105d4eed648270';

/// See also [ItemParamNotifier].
@ProviderFor(ItemParamNotifier)
final itemParamNotifierProvider =
    NotifierProvider<ItemParamNotifier, ItemParam>.internal(
  ItemParamNotifier.new,
  name: r'itemParamNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemParamNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemParamNotifier = Notifier<ItemParam>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
