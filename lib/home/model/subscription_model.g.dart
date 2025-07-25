// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      id: (json['id'] as num?)?.toInt(),
      cafeId: (json['cafe_id'] as num?)?.toInt(),
      subscriptionType: json['subscription_type'] as String?,
      planName: json['plan_name'] as String?,
      transactionId: json['transaction_id'] as String?,
      promoCode: json['promo_code'] as String?,
      expirationDate: json['expiration_date'] == null
          ? null
          : DateTime.parse(json['expiration_date'] as String),
      promoCodeAppliedAt: json['promo_code_applied_at'] == null
          ? null
          : DateTime.parse(json['promo_code_applied_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
