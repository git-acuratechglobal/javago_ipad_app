import 'package:json_annotation/json_annotation.dart';

part 'cafe_stats_model.g.dart';

@JsonSerializable()
class CafeStatsModel {
  CafeStatsModel({
    required this.allOrder,
    required this.todayOrder,
    required this.allRevenue,
    required this.todayRevenue,
  });

  @JsonKey(name: 'all_order')
  final int? allOrder;

  @JsonKey(name: 'today_order')
  final int? todayOrder;

  @JsonKey(name: 'all_revenue')
  final String? allRevenue;

  @JsonKey(name: 'today_revenue')
  final String? todayRevenue;

  factory CafeStatsModel.fromJson(Map<String, dynamic> json) => _$CafeStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CafeStatsModelToJson(this);

}