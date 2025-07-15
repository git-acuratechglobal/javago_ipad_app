import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_state.freezed.dart';

@freezed
abstract class MenuItemState with _$MenuItemState {
  const factory MenuItemState(
      {String? response, required MenuItemEvent menuEvent}) = _MenuItemState;
}

enum MenuItemEvent {
  addMenuItemPressed,
  updateMenuItemPressed,
  deleteMenuItemPressed,
}
