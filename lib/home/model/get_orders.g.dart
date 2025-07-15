// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrdersResponse _$GetOrdersResponseFromJson(Map<String, dynamic> json) =>
    GetOrdersResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      individualOrders: (json['individualOrders'] as List<dynamic>?)
          ?.map((e) => GetOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupCoffeeRunOrders: const GroupCoffeeRunOrdersConverter()
          .fromJson(json['groupCoffeeRunOrders']),
    );

Map<String, dynamic> _$GetOrdersResponseToJson(GetOrdersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'individualOrders': instance.individualOrders,
      'groupCoffeeRunOrders': const GroupCoffeeRunOrdersConverter()
          .toJson(instance.groupCoffeeRunOrders),
    };

GetOrder _$GetOrderFromJson(Map<String, dynamic> json) => GetOrder(
      id: json['id'],
      orderNumber: json['order_number'] as String?,
      status: json['status'],
      userId: json['user_id'],
      name: json['name'] as String?,
      orderPlacedAt: json['order_placed_at'],
      totalAmount: json['total_amount'],
      orderItemArray: (json['order_item_array'] as List<dynamic>?)
          ?.map((e) => OrderItemArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderCompleted: json['order_completed'],
      isIndividualOrder: json['is_individual_order'],
      orderType: json['order_type'] as String?,
      requestUniqueId: json['request_unique_id'] as String?,
      runCreatedAt: json['run_created_at'],
      requestCreatedBy: json['request_created_by'],
      requestCreatedByName: json['request_created_by_name'] as String?,
      orderPlacedAtDate: json['orderPlacedAtDate'] == null
          ? null
          : DateTime.parse(json['orderPlacedAtDate'] as String),
      orderDate: json['orderDate'] as String?,
      orderTime: json['orderTime'] as String?,
      estimatedArrivalTime: json['estimated_arival_time'] as String?,
      fullOrderCancelled: (json['is_full_order_cancelled'] as num?)?.toInt(),
      refundStatus: json['refund_status'] as String?,
    );

Map<String, dynamic> _$GetOrderToJson(GetOrder instance) => <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'user_id': instance.userId,
      'name': instance.name,
      'order_placed_at': instance.orderPlacedAt,
      'total_amount': instance.totalAmount,
      'order_item_array': instance.orderItemArray,
      'order_completed': instance.orderCompleted,
      'is_individual_order': instance.isIndividualOrder,
      'order_type': instance.orderType,
      'request_unique_id': instance.requestUniqueId,
      'run_created_at': instance.runCreatedAt,
      'request_created_by': instance.requestCreatedBy,
      'request_created_by_name': instance.requestCreatedByName,
      'estimated_arival_time': instance.estimatedArrivalTime,
      'is_full_order_cancelled': instance.fullOrderCancelled,
      'refund_status': instance.refundStatus,
      'orderPlacedAtDate': instance.orderPlacedAtDate?.toIso8601String(),
      'orderDate': instance.orderDate,
      'orderTime': instance.orderTime,
    };

OrderItemArray _$OrderItemArrayFromJson(Map<String, dynamic> json) =>
    OrderItemArray(
      itemId: json['item_id'],
      cafeMenuId: json['cafe_menu_id'],
      itemName: json['item_name'] as String?,
      itemSize: json['item_size'] as String?,
      itemType: json['item_type'] as String?,
      itemImage: json['item_image'] as String?,
      addonSizes: (json['addon_sizes'] as List<dynamic>?)
          ?.map((e) => AddonSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemAmount: json['item_amount'],
      itemCategory: json['item_category'] as String?,
      itemQuantity: json['item_quantity'],
      itemDescription: json['item_description'] as String?,
      isSuggestedItem: json['is_suggested_item'],
    );

Map<String, dynamic> _$OrderItemArrayToJson(OrderItemArray instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'cafe_menu_id': instance.cafeMenuId,
      'item_name': instance.itemName,
      'item_size': instance.itemSize,
      'item_type': instance.itemType,
      'item_image': instance.itemImage,
      'addon_sizes': instance.addonSizes,
      'item_amount': instance.itemAmount,
      'item_category': instance.itemCategory,
      'item_quantity': instance.itemQuantity,
      'item_description': instance.itemDescription,
      'is_suggested_item': instance.isSuggestedItem,
    };

AddonSize _$AddonSizeFromJson(Map<String, dynamic> json) => AddonSize(
      addonName: json['addon_name'] as String?,
      addonSizeName: json['addon_size_name'] as String?,
      addonSizePrice: json['addon_size_price'] as String?,
    );

Map<String, dynamic> _$AddonSizeToJson(AddonSize instance) => <String, dynamic>{
      'addon_name': instance.addonName,
      'addon_size_name': instance.addonSizeName,
      'addon_size_price': instance.addonSizePrice,
    };

UnaviableItems _$UnaviableItemsFromJson(Map<String, dynamic> json) =>
    UnaviableItems(
      id: json['id'],
      itemName: json['item_name'] as String?,
      cafeId: json['cafe_id'],
      cafeMenuId: json['cafe_menu_id'],
      itemImageId: json['item_image_id'],
      itemType: json['item_type'],
      itemPrice: json['item_price'] as String?,
      itemDescription: json['item_description'] as String?,
      status: json['status'],
      itemDeletedAt: json['item_deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$UnaviableItemsToJson(UnaviableItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'cafe_id': instance.cafeId,
      'cafe_menu_id': instance.cafeMenuId,
      'item_image_id': instance.itemImageId,
      'item_type': instance.itemType,
      'item_price': instance.itemPrice,
      'item_description': instance.itemDescription,
      'status': instance.status,
      'item_deleted_at': instance.itemDeletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'isSelected': instance.isSelected,
    };
