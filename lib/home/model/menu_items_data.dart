import 'package:json_annotation/json_annotation.dart';
   part 'menu_items_data.g.dart';
@JsonSerializable()
class MenuItem {
    @JsonKey(name: "status")
    String? status;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "data")
    Data? data;

    MenuItem({
        this.status,
        this.message,
        this.data,
    });

    factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

    Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "current_page")
    dynamic currentPage;
    @JsonKey(name: "data")
    List<Datum>? data;
    @JsonKey(name: "first_page_url")
    String? firstPageUrl;
    @JsonKey(name: "from")
    dynamic from;
    @JsonKey(name: "last_page")
    dynamic lastPage;
    @JsonKey(name: "last_page_url")
    String? lastPageUrl;
    @JsonKey(name: "links")
    List<Link>? links;
    @JsonKey(name: "next_page_url")
    dynamic nextPageUrl;
    @JsonKey(name: "path")
    String? path;
    @JsonKey(name: "per_page")
    dynamic perPage;
    @JsonKey(name: "prev_page_url")
    dynamic prevPageUrl;
    @JsonKey(name: "to")
    dynamic to;
    @JsonKey(name: "total")
    dynamic total;

    Data({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    dynamic id;
    @JsonKey(name: "item_name")
    String? itemName;
    @JsonKey(name: "cafe_id")
    dynamic cafeId;
    @JsonKey(name: "cafe_menu_id")
    dynamic cafeMenuId;
    @JsonKey(name: "item_image_id")
    dynamic itemImageId;
    @JsonKey(name: "item_type")
    int? itemType;
    @JsonKey(name: "item_price")
    String? itemPrice;
    @JsonKey(name: "item_description")
    String? itemDescription;
    @JsonKey(name: "status")
    dynamic status;
    @JsonKey(name: "item_deleted_at")
    dynamic itemDeletedAt;
    @JsonKey(name: "created_at")
    dynamic createdAt;
    @JsonKey(name: "updated_at")
    dynamic updatedAt;
    @JsonKey(name: "item_image")
    String? itemImage;
    @JsonKey(name: "item_category")
    String? itemCategory;
    @JsonKey(name: "item_sizes")
    String? itemSizes;
    @JsonKey(name: "addon_options")
    dynamic addonOptions;
    @JsonKey(name: "suggested_items")
    String? suggestedItems;

    Datum({
        this.id,
        this.itemName,
        this.cafeId,
        this.cafeMenuId,
        this.itemImageId,
        this.itemType,
        this.itemPrice,
        this.itemDescription,
        this.status,
        this.itemDeletedAt,
        this.createdAt,
        this.updatedAt,
        this.itemImage,
        this.itemCategory,
        this.itemSizes,
        this.addonOptions,
        this.suggestedItems,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);

    Datum copyWith({
        dynamic id,
        String? itemName,
        dynamic cafeId,
        dynamic cafeMenuId,
        dynamic itemImageId,
        int? itemType,
        String? itemPrice,
        String? itemDescription,
        dynamic status,
        dynamic itemDeletedAt,
        dynamic createdAt,
        dynamic updatedAt,
        String? itemImage,
        String? itemCategory,
        String? itemSizes,
        dynamic addonOptions,
        String? suggestedItems,
    }) {
        return Datum(
            id: id ?? this.id,
            itemName: itemName ?? this.itemName,
            cafeId: cafeId ?? this.cafeId,
            cafeMenuId: cafeMenuId ?? this.cafeMenuId,
            itemImageId: itemImageId ?? this.itemImageId,
            itemType: itemType ?? this.itemType,
            itemPrice: itemPrice ?? this.itemPrice,
            itemDescription: itemDescription ?? this.itemDescription,
            status: status ?? this.status,
            itemDeletedAt: itemDeletedAt ?? this.itemDeletedAt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            itemImage: itemImage ?? this.itemImage,
            itemCategory: itemCategory ?? this.itemCategory,
            itemSizes: itemSizes ?? this.itemSizes,
            addonOptions: addonOptions ?? this.addonOptions,
            suggestedItems: suggestedItems ?? this.suggestedItems,
        );
    }

}

@JsonSerializable()
class Link {
    @JsonKey(name: "url")
    String? url;
    @JsonKey(name: "label")
    String? label;
    @JsonKey(name: "active")
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

    Map<String, dynamic> toJson() => _$LinkToJson(this);
}
