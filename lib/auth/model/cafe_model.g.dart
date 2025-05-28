// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeModel _$CafeModelFromJson(Map<String, dynamic> json) => CafeModel(
      id: (json['id'] as num?)?.toInt(),
      cafeName: json['cafe_name'] as String?,
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
      email: json['email'] as String?,
      bannerImage: json['banner_image'] as String?,
      address: json['address'] as String?,
      postcode: json['postcode'] as String?,
      latitude: (json['latitude'] as num?)?.toInt(),
      longitude: (json['longitude'] as num?)?.toInt(),
      website: json['website'] as String?,
      otp: json['otp'],
      cafeType: (json['cafe_type'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      approved: (json['approved'] as num?)?.toInt(),
      signupCompleted: (json['signup_completed'] as num?)?.toInt(),
      profileCompleted: (json['profile_completed'] as num?)?.toInt(),
      menuCompleted: (json['menu_completed'] as num?)?.toInt(),
      loyaltyCompleted: (json['loyalty_completed'] as num?)?.toInt(),
      isListed: (json['is_listed'] as num?)?.toInt(),
      isOpen: (json['is_open'] as num?)?.toInt(),
      cafeFilter: json['cafe_filter'] as String?,
      cafeTax: (json['cafe_tax'] as num?)?.toInt(),
      deletedAt: (json['deleted_at'] as num?)?.toInt(),
      stripeAccountId: json['stripe_account_id'] as String?,
      stripeCustomerId: json['stripe_customer_id'],
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      otpExpiredAt: (json['otp_expired_at'] as num?)?.toInt(),
      otpVerifiedAt: (json['otp_verified_at'] as num?)?.toInt(),
      transactionId: json['transaction_id'],
      stripeOnboardingCompleted:
          (json['stripe_onboarding_completed'] as num?)?.toInt(),
      isPublished: (json['is_published'] as num?)?.toInt(),
      isAdminApproved: (json['is_admin_approved'] as num?)?.toInt(),
      timing: (json['timing'] as List<dynamic>?)
          ?.map((e) => CafeTiming.fromJson(e as Map<String, dynamic>))
          .toList(),
      cafeManagement: json['cafe_management'] == null
          ? null
          : CafeManagement.fromJson(
              json['cafe_management'] as Map<String, dynamic>),
      cafeClickCollectTiming: (json['cafe_click_collect_timing']
              as List<dynamic>?)
          ?.map(
              (e) => CafeClickCollectTiming.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeModelToJson(CafeModel instance) => <String, dynamic>{
      'id': instance.id,
      'cafe_name': instance.cafeName,
      'phone': instance.phone,
      'bio': instance.bio,
      'email': instance.email,
      'banner_image': instance.bannerImage,
      'address': instance.address,
      'postcode': instance.postcode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'website': instance.website,
      'otp': instance.otp,
      'cafe_type': instance.cafeType,
      'is_active': instance.isActive,
      'approved': instance.approved,
      'signup_completed': instance.signupCompleted,
      'profile_completed': instance.profileCompleted,
      'menu_completed': instance.menuCompleted,
      'loyalty_completed': instance.loyaltyCompleted,
      'is_listed': instance.isListed,
      'is_open': instance.isOpen,
      'cafe_filter': instance.cafeFilter,
      'cafe_tax': instance.cafeTax,
      'deleted_at': instance.deletedAt,
      'stripe_account_id': instance.stripeAccountId,
      'stripe_customer_id': instance.stripeCustomerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'otp_expired_at': instance.otpExpiredAt,
      'otp_verified_at': instance.otpVerifiedAt,
      'transaction_id': instance.transactionId,
      'stripe_onboarding_completed': instance.stripeOnboardingCompleted,
      'is_published': instance.isPublished,
      'is_admin_approved': instance.isAdminApproved,
      'timing': instance.timing,
      'cafe_management': instance.cafeManagement,
      'cafe_click_collect_timing': instance.cafeClickCollectTiming,
    };

CafeClickCollectTiming _$CafeClickCollectTimingFromJson(
        Map<String, dynamic> json) =>
    CafeClickCollectTiming(
      id: (json['id'] as num?)?.toInt(),
      cafeId: (json['cafe_id'] as num?)?.toInt(),
      day: json['day'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CafeClickCollectTimingToJson(
        CafeClickCollectTiming instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cafe_id': instance.cafeId,
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

CafeManagement _$CafeManagementFromJson(Map<String, dynamic> json) =>
    CafeManagement(
      id: (json['id'] as num?)?.toInt(),
      cafeId: (json['cafe_id'] as num?)?.toInt(),
      coffeeOrigin: json['coffee_origin'],
      coffeeRoast: json['coffee_roast'],
      coffeeOriginCountry: json['coffee_origin_country'],
      speciallityCoffee: (json['speciallity_coffee'] as num?)?.toInt(),
      clickAndCollect: (json['click_and_collect'] as num?)?.toInt(),
      maxOrdersClickCollect:
          (json['max_orders_click_collect'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CafeManagementToJson(CafeManagement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cafe_id': instance.cafeId,
      'coffee_origin': instance.coffeeOrigin,
      'coffee_roast': instance.coffeeRoast,
      'coffee_origin_country': instance.coffeeOriginCountry,
      'speciallity_coffee': instance.speciallityCoffee,
      'click_and_collect': instance.clickAndCollect,
      'max_orders_click_collect': instance.maxOrdersClickCollect,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Timing _$TimingFromJson(Map<String, dynamic> json) => Timing(
      id: (json['id'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
      openTime: json['open_time'] as String?,
      closeTime: json['close_time'] as String?,
      cafeId: (json['cafe_id'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TimingToJson(Timing instance) => <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'cafe_id': instance.cafeId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
