// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemParamImpl _$$ItemParamImplFromJson(Map<String, dynamic> json) =>
    _$ItemParamImpl(
      itemName: json['itemName'] as String,
      itemCategoryId: (json['itemCategoryId'] as num).toInt(),
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
      cafe_menu_id: (json['cafe_menu_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ItemParamImplToJson(_$ItemParamImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemCategoryId': instance.itemCategoryId,
      'itemDescription': instance.itemDescription,
      'itemTypeId': instance.itemTypeId,
      'item': instance.item,
      'selectedOptions': instance.selectedOptions,
      'addonItem': instance.addonItem,
      'cafe_menu_id': instance.cafe_menu_id,
    };

_$ItemSizeImpl _$$ItemSizeImplFromJson(Map<String, dynamic> json) =>
    _$ItemSizeImpl(
      itemSizeId: (json['itemSizeId'] as num).toInt(),
      itemPrice: (json['itemPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$ItemSizeImplToJson(_$ItemSizeImpl instance) =>
    <String, dynamic>{
      'itemSizeId': instance.itemSizeId,
      'itemPrice': instance.itemPrice,
    };

_$SelectedOptionImpl _$$SelectedOptionImplFromJson(Map<String, dynamic> json) =>
    _$SelectedOptionImpl(
      optionId: json['optionId'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$SelectedOptionImplToJson(
        _$SelectedOptionImpl instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'price': instance.price,
    };

_$AddonItemImpl _$$AddonItemImplFromJson(Map<String, dynamic> json) =>
    _$AddonItemImpl(
      addonItemId: (json['addonItemId'] as num).toInt(),
    );

Map<String, dynamic> _$$AddonItemImplToJson(_$AddonItemImpl instance) =>
    <String, dynamic>{
      'addonItemId': instance.addonItemId,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemParamNotifierHash() => r'81d7215501a3da82ef416ad5cf335ae86812e56e';

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
