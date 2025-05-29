// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getStamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStamp _$GetStampFromJson(Map<String, dynamic> json) => GetStamp(
      status: json['status'] as String?,
      message: json['message'] as String?,
      loyaltyStamp: json['loyaltyStamp'] == null
          ? null
          : LoyaltyStamp.fromJson(json['loyaltyStamp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStampToJson(GetStamp instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'loyaltyStamp': instance.loyaltyStamp,
    };

LoyaltyStamp _$LoyaltyStampFromJson(Map<String, dynamic> json) => LoyaltyStamp(
      id: (json['id'] as num?)?.toInt(),
      stampColor: json['stamp_color'] as String?,
      stampNo: (json['stamp_no'] as num?)?.toInt(),
      cafeId: (json['cafe_id'] as num?)?.toInt(),
      isUniversal: (json['is_universal'] as num?)?.toInt(),
      discountType: (json['discount_type'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      minOrderValue: (json['min_order_value'] as num?)?.toInt(),
      offerText: json['offer_text'] as String?,
      stampExpiresIn: json['stamp_expires_in'],
      stampApplicableToCategories:
          json['stamp_applicable_to_categories'] as String?,
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      excludedItems: json['excludedItems'] as List<dynamic>?,
    );

Map<String, dynamic> _$LoyaltyStampToJson(LoyaltyStamp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stamp_color': instance.stampColor,
      'stamp_no': instance.stampNo,
      'cafe_id': instance.cafeId,
      'is_universal': instance.isUniversal,
      'discount_type': instance.discountType,
      'discount': instance.discount,
      'min_order_value': instance.minOrderValue,
      'offer_text': instance.offerText,
      'stamp_expires_in': instance.stampExpiresIn,
      'stamp_applicable_to_categories': instance.stampApplicableToCategories,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'excludedItems': instance.excludedItems,
    };
