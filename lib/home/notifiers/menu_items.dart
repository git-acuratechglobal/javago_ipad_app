import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/model/get_menu_items.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
 part 'menu_items.g.dart';
@riverpod
Future<GetMenuItem> menuItems(Ref ref) async {
  return await ref.read(authServiceProvider).getMenuItems();
}


 