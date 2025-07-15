import 'package:json_annotation/json_annotation.dart';

part 'menu_item_details.g.dart';

@JsonSerializable(createToJson: false)
class MenuItemDetails {
  MenuItemDetails({
    required this.itemImageId,
    required this.itemName,
    required this.itemCategory,
    required this.itemType,
    required this.itemDescription,
    required this.itemPrice,
    required this.itemSizePrices,
    required this.optionSizeCafeItems,
    required this.addonItems,
    required this.cafeMenuId
  });

  @JsonKey(name: 'item_image_id')
  final int? itemImageId;

  @JsonKey(name: 'item_name')
  final String? itemName;

  @JsonKey(name: 'item_category')
  final int? itemCategory;

  @JsonKey(name: 'item_type')
  final int? itemType;

  @JsonKey(name: 'item_description')
  final String? itemDescription;

  @JsonKey(name: 'item_price')
  final String? itemPrice;
  @JsonKey(name: 'cafe_menu_id')
  final int cafeMenuId;
  @JsonKey(name: 'item_size_prices')
  final List<ItemSizePrice>? itemSizePrices;
  final List<OptionSizeCafeItem>? optionSizeCafeItems;

  @JsonKey(name: 'addon_items')
  final List<int>? addonItems;

  factory MenuItemDetails.fromJson(Map<String, dynamic> json) => _$MenuItemDetailsFromJson(json);

}

@JsonSerializable(createToJson: false)
class ItemSizePrice {
  ItemSizePrice({
    required this.id,
    required this.itemId,
    required this.sizeId,
    required this.itemSizePrice,
    required this.isDefaultItemSize,
    required this.itemSizeDeletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;

  @JsonKey(name: 'item_id')
  final int? itemId;

  @JsonKey(name: 'size_id')
  final int? sizeId;

  @JsonKey(name: 'item_size_price')
  final String? itemSizePrice;

  @JsonKey(name: 'is_default_item_size')
  final int? isDefaultItemSize;

  @JsonKey(name: 'item_size_deleted_at')
  final int? itemSizeDeletedAt;

  @JsonKey(name: 'created_at')
  final int? createdAt;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  factory ItemSizePrice.fromJson(Map<String, dynamic> json) => _$ItemSizePriceFromJson(json);

}

@JsonSerializable(createToJson: false)
class OptionSizeCafeItem {
  OptionSizeCafeItem({
    required this.addonSizeId,
    required this.addonSizeName,
    required this.addonSizePrice,
    required this.status,
  });

  @JsonKey(name: 'addon_size_id')
  final int? addonSizeId;

  @JsonKey(name: 'addon_size_name')
  final String? addonSizeName;

  @JsonKey(name: 'addon_size_price')
  final String? addonSizePrice;
  final int? status;

  factory OptionSizeCafeItem.fromJson(Map<String, dynamic> json) => _$OptionSizeCafeItemFromJson(json);

}
