import 'package:json_annotation/json_annotation.dart';
part 'stamp_suggestion.g.dart';



@JsonSerializable()
class StampSuggestion {
  @JsonKey(name: "colors")
  ColorsModel? colors;

  @JsonKey(name: "discount_types")
  List<String>? discountTypes;

  @JsonKey(name: "excludeItems")
  Map<String, String>? excludeItems;

  @JsonKey(name: "stampApplicableTo")
  List<StampApplicableTo>? stampApplicableTo;

  StampSuggestion({
    this.colors,
    this.discountTypes,
    this.excludeItems,
    this.stampApplicableTo,
  });

  factory StampSuggestion.fromJson(Map<String, dynamic> json) => _$StampSuggestionFromJson(json);
  Map<String, dynamic> toJson() => _$StampSuggestionToJson(this);
}

@JsonSerializable()
class ColorsModel {
  @JsonKey(name: "#461c10")
  String? the461C10;

  @JsonKey(name: "#9B6842")
  String? the9B6842;

  @JsonKey(name: "#B0876B")
  String? b0876B;

  ColorsModel({
    this.the461C10,
    this.the9B6842,
    this.b0876B,
  });

  factory ColorsModel.fromJson(Map<String, dynamic> json) => _$ColorsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);
}

extension ColorsExtension on ColorsModel {
  List<ColorItem> toColorItems() {
    final items = <ColorItem>[];

    if (the461C10 != null) items.add(ColorItem(hexCode: "#461c10", imageUrl: the461C10!));
    if (the9B6842 != null) items.add(ColorItem(hexCode: "#9B6842", imageUrl: the9B6842!));
    if (b0876B != null) items.add(ColorItem(hexCode: "#B0876B", imageUrl: b0876B!));

    return items;
  }
}


class ColorItem {
  final String hexCode;
  final String imageUrl;

  ColorItem({required this.hexCode, required this.imageUrl});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ColorItem &&
              runtimeType == other.runtimeType &&
              hexCode == other.hexCode;

  @override
  int get hashCode => hexCode.hashCode;
}

@JsonSerializable()
class StampApplicableTo {
  @JsonKey(name: "cafe_menu_id")
  dynamic cafeMenuId;

  @JsonKey(name: "menu_name")
  String? menuName;

  StampApplicableTo({
    this.cafeMenuId,
    this.menuName,
  });

factory StampApplicableTo.fromJson(Map<String, dynamic> json) =>
    _$StampApplicableToFromJson(json);
Map<String, dynamic> toJson() => _$StampApplicableToToJson(this);
}
