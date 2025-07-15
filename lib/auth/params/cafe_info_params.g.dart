// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_info_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CafeInfoParamsImpl _$$CafeInfoParamsImplFromJson(Map<String, dynamic> json) =>
    _$CafeInfoParamsImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
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

Map<String, dynamic> _$$CafeInfoParamsImplToJson(
        _$CafeInfoParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
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
    r'3ca5ae975e741422334b84cf2cfdc5a44d0ad8e5';

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
