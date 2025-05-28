import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_param.freezed.dart';
part 'item_param.g.dart';

@freezed
abstract class ItemParam with _$ItemParam {
  const factory ItemParam({
    required String itemName,
    required int itemCategoryId,
    required int itemImageId,
    required String itemDescription,
    required int itemTypeId,
    required List<ItemSize> item,
    required List<SelectedOption> selectedOptions,
    required List<AddonItem> addonItem,
  }) = _ItemParam;

  factory ItemParam.fromJson(Map<String, dynamic> json) =>
      _$ItemParamFromJson(json);
}

@freezed
abstract class ItemSize with _$ItemSize {
  const factory ItemSize({
    required int itemSizeId,
    required double itemPrice,
  }) = _ItemSize;

  factory ItemSize.fromJson(Map<String, dynamic> json) =>
      _$ItemSizeFromJson(json);
}

@freezed
abstract class SelectedOption with _$SelectedOption {
  const factory SelectedOption({
    required String optionId,
    required double price,
  }) = _SelectedOption;

  factory SelectedOption.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionFromJson(json);
}

@freezed
abstract class AddonItem with _$AddonItem {
  const factory AddonItem({
    required int addonItemId,
  }) = _AddonItem;

  factory AddonItem.fromJson(Map<String, dynamic> json) =>
      _$AddonItemFromJson(json);
}

extension ItemParamSerializer on ItemParam {
  Map<String, dynamic> toApiFormat() {
    final Map<String, dynamic> data = {
      "item_name": itemName,
      "item_category_id": itemCategoryId,
      "item_image_id": itemImageId,
      "item_description": itemDescription,
      "item_type_id": itemTypeId,
    };

    // Item Sizes
    for (int i = 0; i < item.length; i++) {
      data["item[$i][item_size_id]"] = item[i].itemSizeId;
      data["item[$i][item_price]"] = item[i].itemPrice;
    }

    // Selected Options
    for (int i = 0; i < selectedOptions.length; i++) {
      data["item_option[]"] = selectedOptions[i].optionId;
      data["item_price[]"] = selectedOptions[i].price;
    }

    // Addon Items
    for (int i = 0; i < addonItem.length; i++) {
      data["addon_item[$i][addon_item_id]"] = addonItem[i].addonItemId;
    }

    return data;
  }
}


@Riverpod(keepAlive: true)
class ItemParamNotifier extends _$ItemParamNotifier {
  @override
  ItemParam build() {
    return ItemParam(
      itemName: '',
      itemCategoryId: 0,
      itemImageId: 0,
      itemDescription: '',
      itemTypeId: 0,
      item: [],
      selectedOptions: [],
      addonItem: [],
    );
  }

  void updateName(String name) => state = state.copyWith(itemName: name);
  void updateCategoryId(int id) => state = state.copyWith(itemCategoryId: id);
  void updateImageId(int id) => state = state.copyWith(itemImageId: id);
  void updateDescription(String desc) => state = state.copyWith(itemDescription: desc);
  void updateTypeId(int id) => state = state.copyWith(itemTypeId: id);

  void addItemSize(List<ItemSize> sizes) => state = state.copyWith(item: sizes);

  void removeItemSize(int index) {
    final updated = [...state.item]..removeAt(index);
    state = state.copyWith(item: updated);
  }

  void addSelectedOption(List<SelectedOption> options) =>
      state = state.copyWith(selectedOptions: options);

  void addAddonItem(List<AddonItem> addon) =>
      state = state.copyWith(addonItem: addon);
}

