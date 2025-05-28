// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeStatsModel _$CafeStatsModelFromJson(Map<String, dynamic> json) =>
    CafeStatsModel(
      allOrder: (json['all_order'] as num?)?.toInt(),
      todayOrder: (json['today_order'] as num?)?.toInt(),
      allRevenue: json['all_revenue'] as String?,
      todayRevenue: json['today_revenue'] as String?,
    );

Map<String, dynamic> _$CafeStatsModelToJson(CafeStatsModel instance) =>
    <String, dynamic>{
      'all_order': instance.allOrder,
      'today_order': instance.todayOrder,
      'all_revenue': instance.allRevenue,
      'today_revenue': instance.todayRevenue,
    };
