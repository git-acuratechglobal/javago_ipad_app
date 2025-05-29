import 'package:json_annotation/json_annotation.dart';

import 'cafe_time_and_category.dart';

part 'cafe_model.g.dart';

@JsonSerializable()
class CafeModel {
  CafeModel({
    required this.id,
    required this.cafeName,
    required this.phone,
    required this.bio,
    required this.email,
    required this.bannerImage,
    required this.address,
    required this.postcode,
    required this.latitude,
    required this.longitude,
    required this.website,
    required this.otp,
    required this.cafeType,
    required this.isActive,
    required this.approved,
    required this.signupCompleted,
    required this.profileCompleted,
    required this.menuCompleted,
    required this.loyaltyCompleted,
    required this.isListed,
    required this.isOpen,
    required this.cafeFilter,
    required this.cafeTax,
    required this.deletedAt,
    required this.stripeAccountId,
    required this.stripeCustomerId,
    required this.createdAt,
    required this.updatedAt,
    required this.otpExpiredAt,
    required this.otpVerifiedAt,
    required this.transactionId,
    required this.stripeOnboardingCompleted,
    required this.isPublished,
    required this.isAdminApproved,
    required this.timing,
    required this.cafeManagement,
    required this.cafeClickCollectTiming,
  });

  final int? id;

  @JsonKey(name: 'cafe_name')
  final String? cafeName;
  final String? phone;
  final String? bio;
  final String? email;

  @JsonKey(name: 'banner_image')
  final String? bannerImage;
  final String? address;
  final String? postcode;
  final double? latitude;
  final double? longitude;
  final String? website;
  final dynamic otp;

  @JsonKey(name: 'cafe_type')
  final int? cafeType;

  @JsonKey(name: 'is_active')
  final int? isActive;
  final int? approved;

  @JsonKey(name: 'signup_completed')
  final int? signupCompleted;

  @JsonKey(name: 'profile_completed')
  final int? profileCompleted;

  @JsonKey(name: 'menu_completed')
  final int? menuCompleted;

  @JsonKey(name: 'loyalty_completed')
  final int? loyaltyCompleted;

  @JsonKey(name: 'is_listed')
  final int? isListed;

  @JsonKey(name: 'is_open')
  final int? isOpen;

  @JsonKey(name: 'cafe_filter')
  final String? cafeFilter;

  @JsonKey(name: 'cafe_tax')
  final int? cafeTax;

  @JsonKey(name: 'deleted_at')
  final int? deletedAt;

  @JsonKey(name: 'stripe_account_id')
  final String? stripeAccountId;

  @JsonKey(name: 'stripe_customer_id')
  final dynamic stripeCustomerId;

  @JsonKey(name: 'created_at')
  final int? createdAt;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  @JsonKey(name: 'otp_expired_at')
  final int? otpExpiredAt;

  @JsonKey(name: 'otp_verified_at')
  final int? otpVerifiedAt;

  @JsonKey(name: 'transaction_id')
  final dynamic transactionId;

  @JsonKey(name: 'stripe_onboarding_completed')
  final int? stripeOnboardingCompleted;

  @JsonKey(name: 'is_published')
  final int? isPublished;

  @JsonKey(name: 'is_admin_approved')
  final int? isAdminApproved;
  final List<CafeTiming>? timing;

  @JsonKey(name: 'cafe_management')
  final CafeManagement? cafeManagement;

  @JsonKey(name: 'cafe_click_collect_timing')
  final List<CafeClickCollectTiming>? cafeClickCollectTiming;

  factory CafeModel.fromJson(Map<String, dynamic> json) => _$CafeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CafeModelToJson(this);

}

@JsonSerializable()
class CafeClickCollectTiming {
  CafeClickCollectTiming({
     this.id,
    required this.cafeId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isActive,
     this.createdAt,
     this.updatedAt,
  });

  final int? id;

  @JsonKey(name: 'cafe_id')
  final int? cafeId;
  final String? day;

  @JsonKey(name: 'start_time')
  final String? startTime;

  @JsonKey(name: 'end_time')
  final String? endTime;

  @JsonKey(name: 'is_active')
  final int? isActive;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory CafeClickCollectTiming.fromJson(Map<String, dynamic> json) => _$CafeClickCollectTimingFromJson(json);

  Map<String, dynamic> toJson() => _$CafeClickCollectTimingToJson(this);

}

@JsonSerializable()
class CafeManagement {
  CafeManagement({
    required this.id,
    required this.cafeId,
    required this.coffeeOrigin,
    required this.coffeeRoast,
    required this.coffeeOriginCountry,
    required this.speciallityCoffee,
    required this.clickAndCollect,
    required this.maxOrdersClickCollect,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;

  @JsonKey(name: 'cafe_id')
  final int? cafeId;

  @JsonKey(name: 'coffee_origin')
  final dynamic coffeeOrigin;

  @JsonKey(name: 'coffee_roast')
  final dynamic coffeeRoast;

  @JsonKey(name: 'coffee_origin_country')
  final dynamic coffeeOriginCountry;

  @JsonKey(name: 'speciallity_coffee')
  final int? speciallityCoffee;

  @JsonKey(name: 'click_and_collect')
  final int? clickAndCollect;

  @JsonKey(name: 'max_orders_click_collect')
  final int? maxOrdersClickCollect;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  factory CafeManagement.fromJson(Map<String, dynamic> json) => _$CafeManagementFromJson(json);

  Map<String, dynamic> toJson() => _$CafeManagementToJson(this);

}

@JsonSerializable()
class Timing {
  Timing({
    required this.id,
    required this.day,
    required this.openTime,
    required this.closeTime,
    required this.cafeId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? day;

  @JsonKey(name: 'open_time')
  final String? openTime;

  @JsonKey(name: 'close_time')
  final String? closeTime;

  @JsonKey(name: 'cafe_id')
  final int? cafeId;

  @JsonKey(name: 'is_active')
  final int? isActive;

  @JsonKey(name: 'created_at')
  final int? createdAt;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  factory Timing.fromJson(Map<String, dynamic> json) => _$TimingFromJson(json);

  Map<String, dynamic> toJson() => _$TimingToJson(this);

}
