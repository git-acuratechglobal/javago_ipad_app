import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../service/auth_service.dart';
import '../../model/getStamp.dart';
part 'get_stamp_notifier.g.dart';
@riverpod
FutureOr<GetStamp> getStamp(Ref ref,) async {
  return await ref.read(authServiceProvider).getStamp();
}