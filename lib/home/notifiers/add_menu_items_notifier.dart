import 'dart:async';

import 'package:java_go/home/param/item_param/item_param.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../notifier/add_options.dart';
import '../state/menu_item_state/menu_item_state.dart';
import 'menu_item_showing.dart';
part 'add_menu_items_notifier.g.dart';

@riverpod
class AddMenuItemsNotifier extends _$AddMenuItemsNotifier {
  @override
  FutureOr<MenuItemState?> build() async {
    return null;
  }

  Future<void> addMenuItems() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final itemParam = ref.watch(itemParamNotifierProvider).toApiFormat();
      final response = await ref
          .watch(authServiceProvider)
          .addMenuItems(itemsParams: itemParam);
      ref.watch(authServiceProvider).syncMenuToSquare().ignore();
      ref.invalidate(showMenuItemssProvider);
      return MenuItemState(
          menuEvent: MenuItemEvent.addMenuItemPressed, response: response);
    });
  }

  Future<void> updateMenuItems({required int itemId}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final itemParam = ref.watch(itemParamNotifierProvider).toApiFormat();
      final response = await ref
          .watch(authServiceProvider)
          .updateMenuItems(itemsParams: itemParam, itemId: itemId);
      ref.watch(authServiceProvider).syncMenuToSquare().ignore();
      ref.invalidate(showMenuItemssProvider);
      return MenuItemState(
          menuEvent: MenuItemEvent.updateMenuItemPressed, response: response);
    });
  }

  Future<void> deleteMenuItems(int id) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.watch(authServiceProvider).deleteSquareItem(id).ignore();
      final data = await ref.watch(authServiceProvider).deleteMenuItem(id: id);
      ref.invalidate(showMenuItemssProvider);
      ref.invalidate(optionFieldProvider);
      return MenuItemState(
          menuEvent: MenuItemEvent.deleteMenuItemPressed, response: data);
    });
  }
}
