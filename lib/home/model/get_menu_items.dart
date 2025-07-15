import 'package:json_annotation/json_annotation.dart';
part 'get_menu_items.g.dart';

@JsonSerializable()
class GetMenuItem {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  MenuItemData? data;

  GetMenuItem({
    this.status,
    this.message,
    this.data,
  });

  factory GetMenuItem.fromJson(Map<String, dynamic> json) => _$GetMenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$GetMenuItemToJson(this);
}

@JsonSerializable()
class MenuItemData {
  @JsonKey(name: "maxSizePrice")
  dynamic maxSizePrice;

  @JsonKey(name: "sizeNA")
  dynamic sizeNa;

  @JsonKey(name: "preDefinedItem")
  List<PreDefinedItem>? preDefinedItem;

  @JsonKey(name: "itemCategory")
  Map<String, String>? itemCategory;

  @JsonKey(name: "itemType")
  Map<String, String>? itemType;

  @JsonKey(name: "items")
  Map<String, String>? items;

  @JsonKey(name: "itemSize")
  Map<String, String>? itemSize;

  @JsonKey(name: "options")
  Map<String, String>? options;

  @JsonKey(name: "optionSizes")
  List<OptionSize>? optionSizes;

  @JsonKey(name: "addons")
  List<Addon>? addons;

  MenuItemData({
    this.maxSizePrice,
    this.sizeNa,
    this.preDefinedItem,
    this.itemCategory,
    this.itemType,
    this.items,
    this.itemSize,
    this.options,
    this.optionSizes,
    this.addons,
  });

  factory MenuItemData.fromJson(Map<String, dynamic> json) => _$MenuItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemDataToJson(this);

  /// Helper to group optionSizes under their option name
  Map<String, List<OptionSize>> get groupedOptions {
    final Map<String, List<OptionSize>> grouped = {};
    if (options == null || optionSizes == null) return grouped;

    options!.forEach((id, name) {
      final addonId = int.tryParse(id);
      if (addonId != null) {
        final matchedSizes = optionSizes!.where((os) => os.addonId == addonId).toList();
        grouped[name] = matchedSizes;
      }
    });
    return grouped;
  }
}

@JsonSerializable()
class Addon {
  @JsonKey(name: "id")
  dynamic id;

  @JsonKey(name: "item_id")
  dynamic itemId;

  @JsonKey(name: "size_id")
  dynamic sizeId;

  @JsonKey(name: "item_size_price")
  String? itemSizePrice;

  @JsonKey(name: "is_default_item_size")
  dynamic isDefaultItemSize;

  @JsonKey(name: "item_size_deleted_at")
  dynamic itemSizeDeletedAt;

  @JsonKey(name: "created_at")
  dynamic createdAt;

  @JsonKey(name: "updated_at")
  dynamic updatedAt;

  @JsonKey(name: "size_name")
  String? sizeName;

  Addon({
    this.id,
    this.itemId,
    this.sizeId,
    this.itemSizePrice,
    this.isDefaultItemSize,
    this.itemSizeDeletedAt,
    this.createdAt,
    this.updatedAt,
    this.sizeName,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);
  Map<String, dynamic> toJson() => _$AddonToJson(this);
}

@JsonSerializable()
class OptionSize {
  @JsonKey(name: "addon_size_name")
  String? addonSizeName;

  @JsonKey(name: "id")
  dynamic id;

  @JsonKey(name: "addon_id")
  dynamic addonId;

  OptionSize({
    this.addonSizeName,
    this.id,
    this.addonId,
  });

  factory OptionSize.fromJson(Map<String, dynamic> json) => _$OptionSizeFromJson(json);
  Map<String, dynamic> toJson() => _$OptionSizeToJson(this);
}

@JsonSerializable()
class PreDefinedItem {
  @JsonKey(name: "id")
  dynamic id;

  @JsonKey(name: "item_name")
  String? itemName;

  @JsonKey(name: "item_image")
  String? itemImage;

  PreDefinedItem({
    this.id,
    this.itemName,
    this.itemImage,
  });

  factory PreDefinedItem.fromJson(Map<String, dynamic> json) => _$PreDefinedItemFromJson(json);
  Map<String, dynamic> toJson() => _$PreDefinedItemToJson(this);
}

class AddonItemModel {
  final String id;
  final String name;

  AddonItemModel({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AddonItemModel && id == other.id;

  @override
  int get hashCode => id.hashCode;
}