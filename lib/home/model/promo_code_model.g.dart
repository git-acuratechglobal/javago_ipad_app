// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoCodeModel _$PromoCodeModelFromJson(Map<String, dynamic> json) =>
    PromoCodeModel(
      code: json['code'] as String?,
      freeMonths: (json['free_months'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      fixedPrice: json['fixed_price'],
      type: json['type'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      price: json['price'],
      description: json['description'] as String?,
    );
