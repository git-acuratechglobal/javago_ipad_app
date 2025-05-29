import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_stamp_params.freezed.dart';
part 'add_stamp_params.g.dart';

@freezed
abstract class AddStampParams with _$AddStampParams {
  const factory AddStampParams({
    @JsonKey(name: 'stamp_color') required String stampColor,
    @JsonKey(name: 'stamp_no') required int stampNo,
    @JsonKey(name: 'discount_type') required String discountType,
    required int discount,
    @JsonKey(name: 'min_order_value') required double minOrderValue,
    @JsonKey(name: 'offer_text') required String offerText,
    @JsonKey(name: 'stamp_applicable_to_categories')
    required List<String> stampApplicableToCategories,
    @JsonKey(name: 'exclude_items') required List<String> excludeItems,
  }) = _AddStampParams;

  factory AddStampParams.fromJson(Map<String, dynamic> json) =>
      _$AddStampParamsFromJson(json);
}

@Riverpod(keepAlive: true)
class AddStampParamsNotifier extends _$AddStampParamsNotifier {
  @override
  AddStampParams build() {
    return AddStampParams(
        stampColor: '',
        stampNo: 0,
        discountType: '',
        discount: 0,
        minOrderValue: 0,
        offerText: '10% off on your next order',
        stampApplicableToCategories: [],
        excludeItems: []);
  }

  void updateStampColor(String color) {
    state = state.copyWith(stampColor: color);
  }

  void updateStampNo(int no) {
    state = state.copyWith(stampNo: no);
  }

  void updateDiscountType(String type) {
    state = state.copyWith(discountType: type);
  }

  void updateDiscount(int discount) {
    state = state.copyWith(discount: discount);
  }

  void updateMinOrderValue(double value) {
    state = state.copyWith(minOrderValue: value);
  }

  void updateOfferText(String text) {
    state = state.copyWith(offerText: text);
  }

  void updateStampApplicableToCategories(List<String> categories) {
    state = state.copyWith(stampApplicableToCategories: categories);
  }

  void updateExcludeItems(List<String> items) {
    state = state.copyWith(excludeItems: items);
  }
}
