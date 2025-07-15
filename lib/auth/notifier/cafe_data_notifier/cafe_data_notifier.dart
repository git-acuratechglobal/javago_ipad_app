import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/auth/params/cafe_info_params.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/cafe_model.dart';
import '../../model/cafe_time_and_category.dart';
part 'cafe_data_notifier.g.dart';

@riverpod
Future<CafeModel?> getCafeInfo(Ref ref) async {
  final data=  await ref.watch(authServiceProvider).getCafeData();
  ref.read(cafeInfoParamsNotifierProvider.notifier).updateFromCafeModel(data);

  return data;
}


@riverpod
Future<CafeTimeAndCategory> getCafeTimeAndCategory(Ref ref) async {
  return ref.watch(authServiceProvider).getCafeTimeAndCategory();
}