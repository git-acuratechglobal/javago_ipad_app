// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_stamp_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddStampParams _$AddStampParamsFromJson(Map<String, dynamic> json) =>
    _AddStampParams(
      stampColor: json['stamp_color'] as String,
      stampNo: (json['stamp_no'] as num).toInt(),
      discountType: json['discount_type'] as String,
      discount: (json['discount'] as num).toInt(),
      minOrderValue: (json['min_order_value'] as num).toDouble(),
      offerText: json['offer_text'] as String,
      stampApplicableToCategories:
          (json['stamp_applicable_to_categories'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      excludeItems: (json['exclude_items'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AddStampParamsToJson(_AddStampParams instance) =>
    <String, dynamic>{
      'stamp_color': instance.stampColor,
      'stamp_no': instance.stampNo,
      'discount_type': instance.discountType,
      'discount': instance.discount,
      'min_order_value': instance.minOrderValue,
      'offer_text': instance.offerText,
      'stamp_applicable_to_categories': instance.stampApplicableToCategories,
      'exclude_items': instance.excludeItems,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addStampParamsNotifierHash() =>
    r'581dd126d3af3fe315a4e7e84ca0f9bed10ea409';

/// See also [AddStampParamsNotifier].
@ProviderFor(AddStampParamsNotifier)
final addStampParamsNotifierProvider =
    NotifierProvider<AddStampParamsNotifier, AddStampParams>.internal(
  AddStampParamsNotifier.new,
  name: r'addStampParamsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addStampParamsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddStampParamsNotifier = Notifier<AddStampParams>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
