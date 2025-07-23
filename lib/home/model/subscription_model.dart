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
    required this.expirationDate,
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

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);
  String get formattedSubscriptionDate {
    if (expirationDate == null) return 'No expiration date';
    return DateFormat('MMMM dd, yyyy').format(expirationDate!);
  }
}
