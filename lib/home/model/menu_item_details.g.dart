// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemDetails _$MenuItemDetailsFromJson(Map<String, dynamic> json) =>
    MenuItemDetails(
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
      addonItems: (json['addon_items'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      cafeMenuId: (json['cafe_menu_id'] as num).toInt(),
    );

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

OptionSizeCafeItem _$OptionSizeCafeItemFromJson(Map<String, dynamic> json) =>
    OptionSizeCafeItem(
      addonSizeId: (json['addon_size_id'] as num?)?.toInt(),
      addonSizeName: json['addon_size_name'] as String?,
      addonSizePrice: json['addon_size_price'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );
