// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optional_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionalItems _$OptionalItemsFromJson(Map<String, dynamic> json) =>
    OptionalItems(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OptionalItemsToJson(OptionalItems instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      itemImageId: (json['item_image_id'] as num?)?.toInt(),
      itemName: json['item_name'] as String?,
      itemCategory: (json['item_category'] as num?)?.toInt(),
      itemType: (json['item_type'] as num?)?.toInt(),
      itemDescription: json['item_description'] as String?,
      itemPrice: json['item_price'] as String?,
      itemSizePrices: (json['item_size_prices'] as List<dynamic>?)
          ?.map((e) => ItemSizePrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      optionSizeCafeItems: (json['optionSizeCafeItems'] as List<dynamic>?)
          ?.map((e) => OptionSizeCafeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      addonItems: json['addon_items'] as List<dynamic>?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'item_image_id': instance.itemImageId,
      'item_name': instance.itemName,
      'item_category': instance.itemCategory,
      'item_type': instance.itemType,
      'item_description': instance.itemDescription,
      'item_price': instance.itemPrice,
      'item_size_prices': instance.itemSizePrices,
      'optionSizeCafeItems': instance.optionSizeCafeItems,
      'addon_items': instance.addonItems,
    };

ItemSizePrice _$ItemSizePriceFromJson(Map<String, dynamic> json) =>
    ItemSizePrice(
      id: (json['id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      sizeId: (json['size_id'] as num?)?.toInt(),
      itemSizePrice: json['item_size_price'] as String?,
      isDefaultItemSize: (json['is_default_item_size'] as num?)?.toInt(),
      itemSizeDeletedAt: (json['item_size_deleted_at'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemSizePriceToJson(ItemSizePrice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'size_id': instance.sizeId,
      'item_size_price': instance.itemSizePrice,
      'is_default_item_size': instance.isDefaultItemSize,
      'item_size_deleted_at': instance.itemSizeDeletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

OptionSizeCafeItem _$OptionSizeCafeItemFromJson(Map<String, dynamic> json) =>
    OptionSizeCafeItem(
      addonSizeId: (json['addon_size_id'] as num?)?.toInt(),
      addonSizeName: json['addon_size_name'] as String?,
      addonSizePrice: json['addon_size_price'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OptionSizeCafeItemToJson(OptionSizeCafeItem instance) =>
    <String, dynamic>{
      'addon_size_id': instance.addonSizeId,
      'addon_size_name': instance.addonSizeName,
      'addon_size_price': instance.addonSizePrice,
      'status': instance.status,
    };
