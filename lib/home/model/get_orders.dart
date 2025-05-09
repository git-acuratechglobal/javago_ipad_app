import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'get_orders.g.dart';

@JsonSerializable()
class GetOrdersResponse {
  final String? status;
  final String? message;

  @JsonKey(name: "individualOrders")
  final List<GetOrder>? individualOrders;

  @JsonKey(name: "groupCoffeeRunOrders")
  final Map<String, List<GetOrder>>? groupCoffeeRunOrders;

  GetOrdersResponse({
    this.status,
    this.message,
    this.individualOrders,
    this.groupCoffeeRunOrders,
  });

  factory GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersResponseToJson(this);
// List<GetOrder> getUniqueOrdersByRequestId() {
//   final Map<String, GetOrder> uniqueOrdersMap = {};

//   for (final entry in groupCoffeeRunOrders!.entries) {
//     for (final order in entry.value) {
//       uniqueOrdersMap.putIfAbsent(order.requestUniqueId??"", () => order);
//     }
//   }

//   return uniqueOrdersMap.values.toList();
// }

List<GetOrder> get getCombinedUniqueOrders {
  final Map<String, GetOrder> uniqueOrdersMap = {};

  // Merge group coffee run orders using requestUniqueId
  groupCoffeeRunOrders?.forEach((_, orderList) {
    for (final order in orderList) {
      final key = order.requestUniqueId ?? '';
      if (key.isNotEmpty) {
        uniqueOrdersMap.putIfAbsent(key, () => order);
      }
    }
  });

  // Merge individual orders using a prefixed id to avoid collision
  for (final order in individualOrders ?? []) {
    final key = 'individual_${order.id}';
    uniqueOrdersMap.putIfAbsent(key, () => order);
  }

  return uniqueOrdersMap.values.toList();
}



}

@JsonSerializable()
class GetOrder {
  final dynamic id;
  @JsonKey(name: "order_number")
  final String? orderNumber;
  final dynamic status;
  @JsonKey(name: "user_id")
  final dynamic userId;
  final String? name;

  @JsonKey(name: "order_placed_at")
  final dynamic orderPlacedAt;

  @JsonKey(name: "total_amount")
  final dynamic totalAmount;

  @JsonKey(name: "order_item_array")
  final List<OrderItemArray>? orderItemArray;

  @JsonKey(name: "order_completed")
  final dynamic orderCompleted;

  @JsonKey(name: "is_individual_order")
  final dynamic isIndividualOrder;

  @JsonKey(name: "order_type")
  final String? orderType;

  // Group-specific fields
  @JsonKey(name: "request_unique_id")
  final String? requestUniqueId;

  @JsonKey(name: "run_created_at")
  final dynamic runCreatedAt;

  @JsonKey(name: "request_created_by")
  final dynamic requestCreatedBy;

  @JsonKey(name: "request_created_by_name")
  final String? requestCreatedByName;

  // Derived fields
  DateTime? orderPlacedAtDate;
  String? orderDate;
  String? orderTime;

  GetOrder({
    this.id,
    this.orderNumber,
    this.status,
    this.userId,
    this.name,
    this.orderPlacedAt,
    this.totalAmount,
    this.orderItemArray,
    this.orderCompleted,
    this.isIndividualOrder,
    this.orderType,
    this.requestUniqueId,
    this.runCreatedAt,
    this.requestCreatedBy,
    this.requestCreatedByName,
    this.orderPlacedAtDate,
    this.orderDate,
    this.orderTime,
  });

  factory GetOrder.fromJson(Map<String, dynamic> json) {
    final order = _$GetOrderFromJson(json);

    // Convert orderPlacedAt to DateTime and formatted strings
    if (order.orderPlacedAt != null) {
      try {
        int timestamp;
        if (order.orderPlacedAt is int) {
          timestamp = order.orderPlacedAt;
        } else if (order.orderPlacedAt is String) {
          timestamp = int.tryParse(order.orderPlacedAt) ?? 0;
        } else {
          timestamp = 0;
        }

        if (timestamp > 0) {
          order.orderPlacedAtDate = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
          order.orderDate = DateFormat('yyyy-MM-dd').format(order.orderPlacedAtDate!);
          order.orderTime = DateFormat('HH:mm:ss').format(order.orderPlacedAtDate!);
        }
      } catch (e) {
        print('Error parsing orderPlacedAt: $e');
      }
    }

    return order;
  }

  Map<String, dynamic> toJson() => _$GetOrderToJson(this);

  String? getFormattedOrderPlacedDate() {
    if (orderPlacedAtDate == null) return null;
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(orderPlacedAtDate!);
  }
}

@JsonSerializable()
class OrderItemArray {
  @JsonKey(name: "item_id")
  final dynamic itemId;

  @JsonKey(name: "cafe_menu_id")
  final dynamic cafeMenuId;

  @JsonKey(name: "item_name")
  final String? itemName;

  @JsonKey(name: "item_size")
  final String? itemSize;

  @JsonKey(name: "item_type")
  final String? itemType;

  @JsonKey(name: "item_image")
  final String? itemImage;

  @JsonKey(name: "addon_sizes")
  final List<AddonSize>? addonSizes;

  @JsonKey(name: "item_amount")
  final dynamic itemAmount;

  @JsonKey(name: "item_category")
  final String? itemCategory;

  @JsonKey(name: "item_quantity")
  final dynamic itemQuantity;

  @JsonKey(name: "item_description")
  final String? itemDescription;

  @JsonKey(name: "is_suggested_item")
  final dynamic isSuggestedItem;

  OrderItemArray({
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
  });

  factory OrderItemArray.fromJson(Map<String, dynamic> json) =>
      _$OrderItemArrayFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemArrayToJson(this);
}

@JsonSerializable()
class AddonSize {
  @JsonKey(name: "addon_name")
  final String? addonName;

  @JsonKey(name: "addon_size_name")
  final String? addonSizeName;

  @JsonKey(name: "addon_size_price")
  final String? addonSizePrice;

  AddonSize({
    this.addonName,
    this.addonSizeName,
    this.addonSizePrice,
  });

  factory AddonSize.fromJson(Map<String, dynamic> json) =>
      _$AddonSizeFromJson(json);

  Map<String, dynamic> toJson() => _$AddonSizeToJson(this);
}







@JsonSerializable()
class UnaviableItems {
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
    dynamic itemType;
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
   bool isSelected ;
    UnaviableItems({
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
        this.isSelected=false
    });

    factory UnaviableItems.fromJson(Map<String, dynamic> json) => _$UnaviableItemsFromJson(json);

    Map<String, dynamic> toJson() => _$UnaviableItemsToJson(this);
     UnaviableItems copyWith({
    dynamic id,
    String? itemName,
    dynamic cafeId,
    dynamic cafeMenuId,
   dynamic itemImageId,
   dynamic itemType,
    String? itemPrice,
    String? itemDescription,
    dynamic status,
   dynamic itemDeletedAt,
    dynamic createdAt,
    dynamic updatedAt,
    bool? isSelected,
  }) {
    return UnaviableItems(
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
      isSelected: isSelected ?? this.isSelected,
    );
  }
   void toggleSelection() {
    isSelected = !isSelected;
  }
}
