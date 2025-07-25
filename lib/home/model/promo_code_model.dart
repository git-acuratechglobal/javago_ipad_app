import 'package:json_annotation/json_annotation.dart';

part 'promo_code_model.g.dart';

@JsonSerializable(createToJson: false)
class PromoCodeModel {
  PromoCodeModel({
    required this.code,
    required this.freeMonths,
    required this.discount,
    required this.fixedPrice,
    required this.type,
    required this.isActive,
    required this.price,
    required this.description,
  });

  final String? code;

  @JsonKey(name: 'free_months')
  final int? freeMonths;
  final String? discount;

  @JsonKey(name: 'fixed_price')
  final dynamic fixedPrice;
  final String? type;

  @JsonKey(name: 'is_active')
  final int? isActive;
  final dynamic price;
  final String? description;

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => _$PromoCodeModelFromJson(json);

}

