import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'update_addon_item_status.g.dart';

@riverpod
Future<String> updateAddonItemStatus(Ref ref, int id,int status) async {
  return await ref.read(authServiceProvider).updateAddonItemStatus(id,status);
}