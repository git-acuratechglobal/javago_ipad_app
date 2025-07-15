import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/menu_category_order.dart';
part 'menu_category_notifier.g.dart';

@riverpod
class UpdateMenuCategoryNotifier extends _$UpdateMenuCategoryNotifier {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> setCategoryMenu(List<String> data) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final Map<String, dynamic> req = {};

      for (int i = 0; i < data.length; i++) {
        req["order_number[$i]"] = data[i];
      }
      return ref.watch(authServiceProvider).updateMenuCategory(req);
    });
  }
}

@riverpod
Future<List<MenuCategoryOrder>> getMenuCategory(Ref ref) async {
  return await ref.watch(authServiceProvider).getMenuCategory();
}
