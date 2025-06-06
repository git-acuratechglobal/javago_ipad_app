// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StampSuggestion _$StampSuggestionFromJson(Map<String, dynamic> json) =>
    StampSuggestion(
      colors: json['colors'] == null
          ? null
          : ColorsModel.fromJson(json['colors'] as Map<String, dynamic>),
      discountTypes: (json['discount_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      excludeItems: (json['excludeItems'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      stampApplicableTo: (json['stampApplicableTo'] as List<dynamic>?)
          ?.map((e) => StampApplicableTo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StampSuggestionToJson(StampSuggestion instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'discount_types': instance.discountTypes,
      'excludeItems': instance.excludeItems,
      'stampApplicableTo': instance.stampApplicableTo,
    };

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) => ColorsModel(
      the461C10: json['#461c10'] as String?,
      the9B6842: json['#9B6842'] as String?,
      b0876B: json['#B0876B'] as String?,
    );

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
    <String, dynamic>{
      '#461c10': instance.the461C10,
      '#9B6842': instance.the9B6842,
      '#B0876B': instance.b0876B,
    };

StampApplicableTo _$StampApplicableToFromJson(Map<String, dynamic> json) =>
    StampApplicableTo(
      cafeMenuId: json['cafe_menu_id'],
      menuName: json['menu_name'] as String?,
    );

Map<String, dynamic> _$StampApplicableToToJson(StampApplicableTo instance) =>
    <String, dynamic>{
      'cafe_menu_id': instance.cafeMenuId,
      'menu_name': instance.menuName,
    };
