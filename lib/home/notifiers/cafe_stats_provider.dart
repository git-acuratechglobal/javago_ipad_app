import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/cafe_stats_model.dart';
part 'cafe_stats_provider.g.dart';
@riverpod
FutureOr<CafeStatsModel> getCafeStats(Ref ref) async {
  return await ref.watch(authServiceProvider).getCafeStats();
}
