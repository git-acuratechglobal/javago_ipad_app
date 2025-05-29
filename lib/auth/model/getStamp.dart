import 'package:json_annotation/json_annotation.dart';
    part 'getStamp.g.dart';
@JsonSerializable()
class GetStamp {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "loyaltyStamp")
  LoyaltyStamp? loyaltyStamp;

  GetStamp({
    this.status,
    this.message,
    this.loyaltyStamp,
  });

  factory GetStamp.fromJson(Map<String, dynamic> json) => _$GetStampFromJson(json);

  Map<String, dynamic> toJson() => _$GetStampToJson(this);
}

@JsonSerializable()
class LoyaltyStamp {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "stamp_color")
  String? stampColor;
  @JsonKey(name: "stamp_no")
  int? stampNo;
  @JsonKey(name: "cafe_id")
  int? cafeId;
  @JsonKey(name: "is_universal")
  int? isUniversal;
  @JsonKey(name: "discount_type")
  int? discountType;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "min_order_value")
  int? minOrderValue;
  @JsonKey(name: "offer_text")
  String? offerText;
  @JsonKey(name: "stamp_expires_in")
  dynamic stampExpiresIn;
  @JsonKey(name: "stamp_applicable_to_categories")
  String? stampApplicableToCategories;
  @JsonKey(name: "created_at")
  int? createdAt;
  @JsonKey(name: "updated_at")
  int? updatedAt;
  @JsonKey(name: "excludedItems")
  List<dynamic>? excludedItems;

  LoyaltyStamp({
    this.id,
    this.stampColor,
    this.stampNo,
    this.cafeId,
    this.isUniversal,
    this.discountType,
    this.discount,
    this.minOrderValue,
    this.offerText,
    this.stampExpiresIn,
    this.stampApplicableToCategories,
    this.createdAt,
    this.updatedAt,
    this.excludedItems,
  });

  factory LoyaltyStamp.fromJson(Map<String, dynamic> json) => _$LoyaltyStampFromJson(json);

  Map<String, dynamic> toJson() => _$LoyaltyStampToJson(this);
}
