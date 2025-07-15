// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'click_and_collect_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClickAndCollectParamsImpl _$$ClickAndCollectParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ClickAndCollectParamsImpl(
      click_and_collect: (json['click_and_collect'] as num?)?.toInt() ?? 1,
      max_orders_click_collect:
          (json['max_orders_click_collect'] as num?)?.toInt() ?? 2,
      clickAndCollectTime: (json['clickAndCollectTime'] as List<dynamic>)
          .map((e) => CafeDayTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialCafeTime: (json['initialCafeTime'] as List<dynamic>)
          .map(
              (e) => CafeClickCollectTiming.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClickAndCollectParamsImplToJson(
        _$ClickAndCollectParamsImpl instance) =>
    <String, dynamic>{
      'click_and_collect': instance.click_and_collect,
      'max_orders_click_collect': instance.max_orders_click_collect,
      'clickAndCollectTime': instance.clickAndCollectTime,
      'initialCafeTime': instance.initialCafeTime,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clickAndCollectParamHash() =>
    r'5df72291062e0cd3b086f46a268a1581be49de79';

/// See also [ClickAndCollectParam].
@ProviderFor(ClickAndCollectParam)
final clickAndCollectParamProvider =
    NotifierProvider<ClickAndCollectParam, ClickAndCollectParams>.internal(
  ClickAndCollectParam.new,
  name: r'clickAndCollectParamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clickAndCollectParamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClickAndCollectParam = Notifier<ClickAndCollectParams>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
