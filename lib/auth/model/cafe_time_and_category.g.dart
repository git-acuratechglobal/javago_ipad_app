// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_time_and_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeTimeAndCategory _$CafeTimeAndCategoryFromJson(Map<String, dynamic> json) =>
    CafeTimeAndCategory(
      status: json['status'] as String?,
      cafeFilters: (json['cafeFilters'] as List<dynamic>?)
          ?.map((e) => CafeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      cafeTimings: (json['cafeTimings'] as List<dynamic>?)
          ?.map((e) => CafeTiming.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeTimeAndCategoryToJson(
        CafeTimeAndCategory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'cafeFilters': instance.cafeFilters,
      'cafeTimings': instance.cafeTimings,
    };

CafeFilter _$CafeFilterFromJson(Map<String, dynamic> json) => CafeFilter(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      color: json['color'] as String?,
      lightColor: json['light_color'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CafeFilterToJson(CafeFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'color': instance.color,
      'light_color': instance.lightColor,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

CafeTiming _$CafeTimingFromJson(Map<String, dynamic> json) => CafeTiming(
      id: (json['id'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
      openTime: json['open_time'] as String?,
      closeTime: json['close_time'] as String?,
      cafeId: (json['cafe_id'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CafeTimingToJson(CafeTiming instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'cafe_id': instance.cafeId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
