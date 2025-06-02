import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../menuinfoscreen.dart';
import '../../notifiers/add_option_items.dart';
import '../../notifiers/menu_item_showing.dart';
part 'update_menu_item_status_notifier.g.dart';
// @riverpod
// Future<String?> updateMenuItemStatus(Ref ref,
//     {required int itemId, required int status}) async {
//   return ref.watch(authServiceProvider).updateMenuItemStatus(itemId, status);
// }

@riverpod
class UpdateMenuItemStatusNotifier extends _$UpdateMenuItemStatusNotifier {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> updateMenuItemStatus({required int itemId, required int status}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result= ref
          .watch(authServiceProvider)
          .updateMenuItemStatus(itemId, status);
       ref.invalidate(showMenuItemssProvider);
      return result;
    });
  }

  Future<void> updateAddonItemStatus({required int id, required int status}) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result= await ref
          .read(authServiceProvider)
          .updateAddonItemStatus(id, status);
      ref.invalidate(consolidatedOptionsProvider);
      ref.invalidate(optionalItemProvider);
      return result;
    });
  }
}
