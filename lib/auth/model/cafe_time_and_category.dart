import 'package:json_annotation/json_annotation.dart';
part 'cafe_time_and_category.g.dart';
@JsonSerializable()
class CafeTimeAndCategory {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "cafeFilters")
  List<CafeFilter>? cafeFilters;
  @JsonKey(name: "cafeTimings")
  List<CafeTiming>? cafeTimings;

  CafeTimeAndCategory({
    this.status,
    this.cafeFilters,
    this.cafeTimings,
  });

  factory CafeTimeAndCategory.fromJson(Map<String, dynamic> json) => _$CafeTimeAndCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CafeTimeAndCategoryToJson(this);
}

@JsonSerializable()
class CafeFilter {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "light_color")
  String? lightColor;
  @JsonKey(name: "is_active")
  int? isActive;
  @JsonKey(name: "created_at")
  int? createdAt;
  @JsonKey(name: "updated_at")
  int? updatedAt;

  CafeFilter({
    this.id,
    this.name,
    this.image,
    this.color,
    this.lightColor,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory CafeFilter.fromJson(Map<String, dynamic> json) => _$CafeFilterFromJson(json);

  Map<String, dynamic> toJson() => _$CafeFilterToJson(this);
}

@JsonSerializable()
class CafeTiming {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "day")
  int? day;
  @JsonKey(name: "open_time")
  String? openTime;
  @JsonKey(name: "close_time")
  String? closeTime;
  @JsonKey(name: "cafe_id")
  int? cafeId;
  @JsonKey(name: "is_active")
  int? isActive;
  @JsonKey(name: "created_at")
  int? createdAt;
  @JsonKey(name: "updated_at")
  int? updatedAt;

  CafeTiming({
    this.id,
    this.day,
    this.openTime,
    this.closeTime,
    this.cafeId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory CafeTiming.fromJson(Map<String, dynamic> json) => _$CafeTimingFromJson(json);

  Map<String, dynamic> toJson() => _$CafeTimingToJson(this);
}
