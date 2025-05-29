// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_info_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CafeInfoParams _$CafeInfoParamsFromJson(Map<String, dynamic> json) =>
    _CafeInfoParams(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      postcode: json['postcode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      categories: json['categories'] as String,
      bio: json['bio'] as String,
      coffeeOrigin: json['coffee_origin'] as String,
      coffeeRoast: json['coffee_roast'] as String,
      coffeeOriginCountry: json['coffee_origin_country'] as String,
      speciallityCoffee: (json['speciallity_coffee'] as num).toInt(),
      image: json['image'] as String?,
      cafeTimes: (json['cafeTimes'] as List<dynamic>?)
          ?.map((e) => CafeDayTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeInfoParamsToJson(_CafeInfoParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'postcode': instance.postcode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'categories': instance.categories,
      'bio': instance.bio,
      'coffee_origin': instance.coffeeOrigin,
      'coffee_roast': instance.coffeeRoast,
      'coffee_origin_country': instance.coffeeOriginCountry,
      'speciallity_coffee': instance.speciallityCoffee,
      'image': instance.image,
      'cafeTimes': instance.cafeTimes,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cafeInfoParamsNotifierHash() =>
    r'84330c4a08fa76ea3d21f241addc17c24b1b53a3';

/// See also [CafeInfoParamsNotifier].
@ProviderFor(CafeInfoParamsNotifier)
final cafeInfoParamsNotifierProvider =
    NotifierProvider<CafeInfoParamsNotifier, CafeInfoParams>.internal(
  CafeInfoParamsNotifier.new,
  name: r'cafeInfoParamsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cafeInfoParamsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CafeInfoParamsNotifier = Notifier<CafeInfoParams>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
