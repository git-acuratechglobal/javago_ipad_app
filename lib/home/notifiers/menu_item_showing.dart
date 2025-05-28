import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/model/menu_items_data.dart';
import 'package:java_go/home/notifier/pagination_notifier.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
  part 'menu_item_showing.g.dart';
@Riverpod(keepAlive: true)
FutureOr<MenuItem> showMenuItemss(Ref ref) async {
   final currentPage = ref.watch(paginationProvider);
  return await ref.read(authServiceProvider).showMenuItems(currentPage);
}
