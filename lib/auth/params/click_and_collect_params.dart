import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/cafe_model.dart';
import '../model/cafe_time_and_category.dart';
import '../model/cafetime_model.dart';

part 'click_and_collect_params.freezed.dart';
part 'click_and_collect_params.g.dart';

@freezed
abstract class ClickAndCollectParams with _$ClickAndCollectParams {
  const factory ClickAndCollectParams(
      {@Default(1) int click_and_collect,
      @Default(12) int max_orders_click_collect,
      required List<CafeDayTime> clickAndCollectTime,
      required List<CafeClickCollectTiming> initialCafeTime
      }) = _ClickAndCollectParams;

  factory ClickAndCollectParams.fromJson(Map<String, dynamic> json) =>
      _$ClickAndCollectParamsFromJson(json);

  factory ClickAndCollectParams.empty() {
    return ClickAndCollectParams(clickAndCollectTime: [],initialCafeTime: []);
  }
}

@Riverpod(keepAlive: true)
class ClickAndCollectParam extends _$ClickAndCollectParam {
  @override
  ClickAndCollectParams build() {
    return ClickAndCollectParams.empty();
  }

  void updateClickAndCollect(int clickAndCollect) {
    state = state.copyWith(click_and_collect: clickAndCollect);
  }

  void updateMaxOrder(int maxOrder) {
    state = state.copyWith(max_orders_click_collect: maxOrder);
  }

  void updateTiming(List<CafeDayTime> time) {
    state = state.copyWith(clickAndCollectTime: time);
  }

  void updateClickAndCollectParam({required CafeModel cafeModel}) {
    final management = cafeModel.cafeManagement;

    final rawTiming = (cafeModel.cafeClickCollectTiming?.isNotEmpty ?? false)
        ? cafeModel.cafeClickCollectTiming
        : cafeModel.timing?.map((e) => CafeClickCollectTiming(
      cafeId: e.cafeId,
      day: e.day.toString(),
      startTime: e.openTime,
      endTime: e.closeTime,
      isActive: null,
    )).toList();

    state = ClickAndCollectParams(
      click_and_collect: management?.clickAndCollect ?? state.click_and_collect,
      max_orders_click_collect:
      management?.maxOrdersClickCollect ?? state.max_orders_click_collect,
      clickAndCollectTime: rawTiming != null
          ? convertCafeTimingToCafeDayTime(rawTiming)
          : state.clickAndCollectTime,
      initialCafeTime: rawTiming ?? [],
    );
  }
  void updateClickAndCollectParamForInitial({required CafeModel cafeModel}) {


    final rawTiming = (cafeModel.cafeClickCollectTiming?.isNotEmpty ?? false)
        ? cafeModel.cafeClickCollectTiming
        : cafeModel.timing?.map((e) => CafeClickCollectTiming(
      cafeId: e.cafeId,
      day: e.day.toString(),
      startTime: e.openTime,
      endTime: e.closeTime,
      isActive: e.isActive,
    )).toList();

    state = ClickAndCollectParams(
      click_and_collect:1,
      max_orders_click_collect:2,
      clickAndCollectTime: rawTiming != null
          ? convertCafeTimingToCafeDayTime(rawTiming)
          : state.clickAndCollectTime,
      initialCafeTime: rawTiming ?? [],
    );
  }


  List<CafeDayTime> convertCafeTimingToCafeDayTime(List<dynamic> list) {
    return list.map((item) {
      if (item is CafeClickCollectTiming) {
        return CafeDayTime(
          day: item.day ?? '',
          openingTime:
              const TimeOfDayConverter().fromJson(item.startTime ?? '00:00'),
          closingTime:
              const TimeOfDayConverter().fromJson(item.endTime ?? '00:00'),
          isActive: item.isActive ?? 1,
        );
      } else if (item is CafeTiming) {
        return CafeDayTime(
          day: item.day?.toString() ?? '',
          openingTime:
              const TimeOfDayConverter().fromJson(item.openTime ?? '00:00'),
          closingTime:
              const TimeOfDayConverter().fromJson(item.closeTime ?? '00:00'),
          isActive: item.isActive ?? 1,
        );
      } else {
        throw Exception("Unsupported timing type");
      }
    }).toList();
  }
}
