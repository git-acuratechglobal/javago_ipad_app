// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategoryOrder _$MenuCategoryOrderFromJson(Map<String, dynamic> json) =>
    MenuCategoryOrder(
      id: (json['id'] as num?)?.toInt(),
      menuName: json['menu_name'] as String?,
      orderNumber: (json['order_number'] as num?)?.toInt(),
      itemCount: (json['item_count'] as num?)?.toInt(),
    );
