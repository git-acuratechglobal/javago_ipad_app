import 'package:json_annotation/json_annotation.dart';
part 'order_detail.g.dart';

@JsonSerializable()
class GetOrderDetails {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "orders")
  List<Order>? orders;

  GetOrderDetails({
    this.status,
    this.message,
    this.orders,
  });

  factory GetOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderDetailsToJson(this);

  Map<String, List<Order>> groupOrdersByCustomer() {
    final Map<String, List<Order>> customerOrders = {};
    if (orders != null && orders!.isNotEmpty) {
      for (var item in orders!) {
        final customerName = item.customerName ?? "";

        if (!customerOrders.containsKey(customerName)) {
          customerOrders[customerName] = [];
        }

        customerOrders[customerName]!.add(item);
      }
    }

    return customerOrders;
  }
}

@JsonSerializable()
class Order {
  @JsonKey(name: "item_id")
  int? itemId;
  @JsonKey(name: "cafe_menu_id")
  dynamic cafeMenuId;
  @JsonKey(name: "item_name")
  String? itemName;
  @JsonKey(name: "item_size")
  String? itemSize;
  @JsonKey(name: "item_type")
  String? itemType;
  @JsonKey(name: "item_image")
  String? itemImage;
  @JsonKey(name: "addon_sizes")
  List<AddonSize>? addonSizes;
  @JsonKey(name: "item_amount")
  int? itemAmount;
  @JsonKey(name: "item_category")
  String? itemCategory;
  @JsonKey(name: "item_quantity")
  int? itemQuantity;
  @JsonKey(name: "item_description")
  String? itemDescription;
  @JsonKey(name: "is_suggested_item")
  int? isSuggestedItem;
  @JsonKey(name: "customer_name")
  String? customerName;
  @JsonKey(name: "creator_name")
  String? creatorName;
  @JsonKey(name: "request_unique_id")
  String? requestUniqueId;
  @JsonKey(name: "order_number")
  String? orderNumber;

  Order({
    this.itemId,
    this.cafeMenuId,
    this.itemName,
    this.itemSize,
    this.itemType,
    this.itemImage,
    this.addonSizes,
    this.itemAmount,
    this.itemCategory,
    this.itemQuantity,
    this.itemDescription,
    this.isSuggestedItem,
    this.customerName,
    this.creatorName,
    this.requestUniqueId,
    this.orderNumber,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class AddonSize {
  @JsonKey(name: "addon_name")
  String? addonName;
  @JsonKey(name: "addon_size_name")
  String? addonSizeName;
  @JsonKey(name: "addon_size_price")
  String? addonSizePrice;

  AddonSize({
    this.addonName,
    this.addonSizeName,
    this.addonSizePrice,
  });

  factory AddonSize.fromJson(Map<String, dynamic> json) =>
      _$AddonSizeFromJson(json);

  Map<String, dynamic> toJson() => _$AddonSizeToJson(this);
}
