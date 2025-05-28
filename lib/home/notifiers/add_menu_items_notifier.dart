import 'dart:async';

import 'package:java_go/home/param/item_param/item_param.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_menu_items_notifier.g.dart';

@riverpod
class AddMenuItemsNotifier extends _$AddMenuItemsNotifier {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> addMenuItems() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final itemParam = ref.watch(itemParamNotifierProvider).toApiFormat();
      return ref
          .watch(authServiceProvider)
          .addMenuItems(itemsParams: itemParam);
    });
  }
}
