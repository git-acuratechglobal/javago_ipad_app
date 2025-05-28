import 'package:json_annotation/json_annotation.dart';
part 'optional_data.g.dart';
@JsonSerializable()
class OptionalItems {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;

  OptionalItems({
    this.status,
    this.message,
    this.data,
  });

  factory OptionalItems.fromJson(Map<String, dynamic> json) => _$OptionalItemsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalItemsToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "item_image_id")
  int? itemImageId;
  @JsonKey(name: "item_name")
  String? itemName;
  @JsonKey(name: "item_category")
  int? itemCategory;
  @JsonKey(name: "item_type")
  int? itemType;
  @JsonKey(name: "item_description")
  String? itemDescription;
  @JsonKey(name: "item_price")
  String? itemPrice;
  @JsonKey(name: "item_size_prices")
  List<ItemSizePrice>? itemSizePrices;
  @JsonKey(name: "optionSizeCafeItems")
  List<OptionSizeCafeItem>? optionSizeCafeItems;
  @JsonKey(name: "addon_items")
  List<dynamic>? addonItems;

  Data({
    this.itemImageId,
    this.itemName,
    this.itemCategory,
    this.itemType,
    this.itemDescription,
    this.itemPrice,
    this.itemSizePrices,
    this.optionSizeCafeItems,
    this.addonItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ItemSizePrice {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "item_id")
  int? itemId;
  @JsonKey(name: "size_id")
  int? sizeId;
  @JsonKey(name: "item_size_price")
  String? itemSizePrice;
  @JsonKey(name: "is_default_item_size")
  int? isDefaultItemSize;
  @JsonKey(name: "item_size_deleted_at")
  int? itemSizeDeletedAt;
  @JsonKey(name: "created_at")
  int? createdAt;
  @JsonKey(name: "updated_at")
  int? updatedAt;

  ItemSizePrice({
    this.id,
    this.itemId,
    this.sizeId,
    this.itemSizePrice,
    this.isDefaultItemSize,
    this.itemSizeDeletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemSizePrice.fromJson(Map<String, dynamic> json) => _$ItemSizePriceFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSizePriceToJson(this);
}

@JsonSerializable()
class OptionSizeCafeItem {
  @JsonKey(name: "addon_size_id")
  int? addonSizeId;
  @JsonKey(name: "addon_size_name")
  String? addonSizeName;
  @JsonKey(name: "addon_size_price")
  String? addonSizePrice;
  @JsonKey(name: "status")
  int? status;

  OptionSizeCafeItem({
    this.addonSizeId,
    this.addonSizeName,
    this.addonSizePrice,
    this.status,
  });

  factory OptionSizeCafeItem.fromJson(Map<String, dynamic> json) =>
      _$OptionSizeCafeItemFromJson(json);

  Map<String, dynamic> toJson() => _$OptionSizeCafeItemToJson(this);
}
