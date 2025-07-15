import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/getStamp.dart';

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
   @JsonKey(name: 'stamp_expires_in')required String  expireIn,
  }) = _AddStampParams;

  factory AddStampParams.fromJson(Map<String, dynamic> json) =>
      _$AddStampParamsFromJson(json);
}

extension AddStampParamsQuery on AddStampParams {
  Map<String, dynamic> toQueryParameters() {
    final params = {
      'stamp_color': stampColor,
      'stamp_no': stampNo,
      'discount_type': discountType,
      'discount': discount,
      'min_order_value': minOrderValue,
      'offer_text': offerText,
      'stamp_expires_in':expireIn
    };
    for (var i = 0; i < stampApplicableToCategories.length; i++) {
      params['stamp_applicable_to_categories[]'] =
          stampApplicableToCategories[i];
    }

    for (var i = 0; i < excludeItems.length; i++) {
      params['exclude_item[]'] = excludeItems[i];
    }

    return params;
  }
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
        offerText: '10',
        stampApplicableToCategories: [],
        excludeItems: [],
    expireIn: ""
    );
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

  void updateAddStampParam(LoyaltyStamp stamp) {
    state = AddStampParams(
        stampColor: stamp.stampColor ?? "",
        stampNo: stamp.stampNo ?? 0,
        discountType: stamp.discountType!=null?stamp.discountType==0?"%":"£":"",
        discount: stamp.discount ?? 0,
        minOrderValue: stamp.minOrderValue?.toDouble() ?? 0.0,
        offerText: stamp.offerText ?? "",
        stampApplicableToCategories: stamp.decodedStampApplicableToCategories,
        excludeItems:
            stamp.excludedItems?.map((e) => e.itemId.toString()).toList() ??
                [],
    expireIn: stamp.stampExpiresIn??""
    );
  }
}
