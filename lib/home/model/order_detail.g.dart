// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderDetails _$GetOrderDetailsFromJson(Map<String, dynamic> json) =>
    GetOrderDetails(
      status: json['status'] as String?,
      message: json['message'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetOrderDetailsToJson(GetOrderDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'orders': instance.orders,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      itemId: (json['item_id'] as num?)?.toInt(),
      cafeMenuId: json['cafe_menu_id'],
      itemName: json['item_name'] as String?,
      itemSize: json['item_size'] as String?,
      itemType: json['item_type'] as String?,
      itemImage: json['item_image'] as String?,
      addonSizes: (json['addon_sizes'] as List<dynamic>?)
          ?.map((e) => AddonSize.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemAmount: (json['item_amount'] as num?)?.toInt(),
      itemCategory: json['item_category'] as String?,
      itemQuantity: (json['item_quantity'] as num?)?.toInt(),
      itemDescription: json['item_description'] as String?,
      isSuggestedItem: (json['is_suggested_item'] as num?)?.toInt(),
      customerName: json['customer_name'] as String?,
      creatorName: json['creator_name'] as String?,
      requestUniqueId: json['request_unique_id'] as String?,
      orderNumber: json['order_number'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
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
      'customer_name': instance.customerName,
      'creator_name': instance.creatorName,
      'request_unique_id': instance.requestUniqueId,
      'order_number': instance.orderNumber,
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
