import 'package:json_annotation/json_annotation.dart';

part 'menu_category_order.g.dart';

@JsonSerializable(createToJson: false)
class MenuCategoryOrder {
  MenuCategoryOrder({
    required this.id,
    required this.menuName,
    required this.orderNumber,
    required this.itemCount,
  });

  final int? id;

  @JsonKey(name: 'menu_name')
  final String? menuName;

  @JsonKey(name: 'order_number')
  final int? orderNumber;

  @JsonKey(name: 'item_count')
  final int? itemCount;

  factory MenuCategoryOrder.fromJson(Map<String, dynamic> json) => _$MenuCategoryOrderFromJson(json);

}
