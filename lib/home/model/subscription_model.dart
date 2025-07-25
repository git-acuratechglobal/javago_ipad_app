import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

@JsonSerializable(createToJson: false)
class SubscriptionModel {
  SubscriptionModel({
    required this.id,
    required this.cafeId,
    required this.subscriptionType,
    required this.planName,
    required this.transactionId,
    required this.promoCode,
    required this.expirationDate,
    required this.promoCodeAppliedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;

  @JsonKey(name: 'cafe_id')
  final int? cafeId;

  @JsonKey(name: 'subscription_type')
  final String? subscriptionType;

  @JsonKey(name: 'plan_name')
  final String? planName;

  @JsonKey(name: 'transaction_id')
  final String? transactionId;

  @JsonKey(name: 'expiration_date')
  final DateTime? expirationDate;
  @JsonKey(name: 'promo_code')
  final String? promoCode;
  @JsonKey(name: 'promo_code_applied_at')
  final DateTime? promoCodeAppliedAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  String get formattedSubscriptionDate {
    if (expirationDate == null) return 'No expiration date';
    if (isExpired)
      return 'Expired on ${DateFormat('MMMM dd, yyyy').format(expirationDate!)}';
    return DateFormat('MMMM dd, yyyy').format(expirationDate!);
  }

  bool get isExpired {
    if (expirationDate == null) return true;
    return DateTime.now().isAfter(expirationDate!);
  }

  bool get shouldApplyDiscount {
    if (promoCodeAppliedAt == null) return false;
    final now = DateTime.now();
    final monthsPassed = (now.year - promoCodeAppliedAt!.year) * 12 +
        (now.month - promoCodeAppliedAt!.month);

    // Month 0 = free, Months 1–12 = 15% off, After 12 = no discount
    return monthsPassed <= 12;
  }
}
