import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/model/optional_data.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
 part 'add_option_items.g.dart';
@riverpod
FutureOr<OptionalItems> OptionalItem(Ref ref, int id) async {
  return await ref.read(authServiceProvider).getOptionItems(id);
}
