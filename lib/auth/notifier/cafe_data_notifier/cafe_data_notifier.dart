import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/auth/params/cafe_info_params.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/cafe_model.dart';
import '../../model/cafe_time_and_category.dart';
import '../../params/click_and_collect_params.dart';
part 'cafe_data_notifier.g.dart';

@riverpod
Future<CafeModel?> getCafeInfo(Ref ref) async {
  final data = await ref.watch(authServiceProvider).getCafeData();
  ref.read(cafeInfoParamsNotifierProvider.notifier).updateFromCafeModel(data);
  if (data?.cafeClickCollectTiming != null &&
      data!.cafeClickCollectTiming!.isNotEmpty) {
    ref
        .read(clickAndCollectParamProvider.notifier)
        .updateClickAndCollectParam(cafeModel: data);
  } else {
    ref
        .read(clickAndCollectParamProvider.notifier)
        .updateClickAndCollectParamForInitial(cafeModel: data!);
  }
  return data;
}

@riverpod
Future<CafeTimeAndCategory> getCafeTimeAndCategory(Ref ref) async {
  return ref.watch(authServiceProvider).getCafeTimeAndCategory();
}
