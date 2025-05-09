// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_menu_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMenuItem _$GetMenuItemFromJson(Map<String, dynamic> json) => GetMenuItem(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMenuItemToJson(GetMenuItem instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      maxSizePrice: json['maxSizePrice'],
      sizeNa: json['sizeNA'],
      preDefinedItem: (json['preDefinedItem'] as List<dynamic>?)
          ?.map((e) => PreDefinedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCategory: (json['itemCategory'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      itemType: (json['itemType'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      items: (json['items'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      itemSize: (json['itemSize'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      options: (json['options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      optionSizes: (json['optionSizes'] as List<dynamic>?)
          ?.map((e) => OptionSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      addons: (json['addons'] as List<dynamic>?)
          ?.map((e) => Addon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'maxSizePrice': instance.maxSizePrice,
      'sizeNA': instance.sizeNa,
      'preDefinedItem': instance.preDefinedItem,
      'itemCategory': instance.itemCategory,
      'itemType': instance.itemType,
      'items': instance.items,
      'itemSize': instance.itemSize,
      'options': instance.options,
      'optionSizes': instance.optionSizes,
      'addons': instance.addons,
    };

Addon _$AddonFromJson(Map<String, dynamic> json) => Addon(
      id: json['id'],
      itemId: json['item_id'],
      sizeId: json['size_id'],
      itemSizePrice: json['item_size_price'] as String?,
      isDefaultItemSize: json['is_default_item_size'],
      itemSizeDeletedAt: json['item_size_deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      sizeName: json['size_name'] as String?,
    );

Map<String, dynamic> _$AddonToJson(Addon instance) => <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'size_id': instance.sizeId,
      'item_size_price': instance.itemSizePrice,
      'is_default_item_size': instance.isDefaultItemSize,
      'item_size_deleted_at': instance.itemSizeDeletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'size_name': instance.sizeName,
    };

OptionSize _$OptionSizeFromJson(Map<String, dynamic> json) => OptionSize(
      addonSizeName: json['addon_size_name'] as String?,
      id: json['id'],
      addonId: json['addon_id'],
    );

Map<String, dynamic> _$OptionSizeToJson(OptionSize instance) =>
    <String, dynamic>{
      'addon_size_name': instance.addonSizeName,
      'id': instance.id,
      'addon_id': instance.addonId,
    };

PreDefinedItem _$PreDefinedItemFromJson(Map<String, dynamic> json) =>
    PreDefinedItem(
      id: json['id'],
      itemName: json['item_name'] as String?,
      itemImage: json['item_image'] as String?,
    );

Map<String, dynamic> _$PreDefinedItemToJson(PreDefinedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'item_image': instance.itemImage,
    };
