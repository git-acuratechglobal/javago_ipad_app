// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_items_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: json['current_page'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'] as String?,
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'],
      itemName: json['item_name'] as String?,
      cafeId: json['cafe_id'],
      cafeMenuId: json['cafe_menu_id'],
      itemImageId: json['item_image_id'],
      itemType: (json['item_type'] as num?)?.toInt(),
      itemPrice: json['item_price'] as String?,
      itemDescription: json['item_description'] as String?,
      status: json['status'],
      itemDeletedAt: json['item_deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      itemImage: json['item_image'] as String?,
      itemCategory: json['item_category'] as String?,
      itemSizes: json['item_sizes'] as String?,
      addonOptions: json['addon_options'],
      suggestedItems: json['suggested_items'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
      'item_image': instance.itemImage,
      'item_category': instance.itemCategory,
      'item_sizes': instance.itemSizes,
      'addon_options': instance.addonOptions,
      'suggested_items': instance.suggestedItems,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
