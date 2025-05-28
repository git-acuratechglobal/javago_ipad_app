import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delete_item.g.dart';

@riverpod
Future<String> deleteItem(Ref ref, int id) async {
  return await ref.read(authServiceProvider).deleteItem(id);
}
