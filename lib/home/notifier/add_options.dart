import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../param/item_param/item_param.dart';

class OptionFieldData {
  final int key;
  final int? addonSizeId;
  final int? addonId;
  final double? price;

  OptionFieldData({
    required this.key,
    this.addonSizeId,
    this.addonId,
    this.price,
  });

  OptionFieldData copyWith({
    int? key,
    int? addonSizeId,
    int? addonId,
    double? price,
  }) {
    return OptionFieldData(
      key: key ?? this.key,
      addonSizeId: addonSizeId ?? this.addonSizeId,
      addonId: addonId ?? this.addonId,
      price: price ?? this.price,
    );
  }
}

class OptionFieldNotifier extends StateNotifier<List<OptionFieldData>> {
  OptionFieldNotifier() : super([]);
  int _counter = 1;

  void addField() {
    state = [...state, OptionFieldData(key: _counter++)];
  }
  void setFieldsFromSelectedOptions(List<SelectedOption> selectedOptions) {
    _counter = 1; // Reset the key counter
    state = selectedOptions.map((selected) {
      return OptionFieldData(
        key: _counter++,
        addonSizeId: int.tryParse(selected.optionId),
        price: selected.price,
      );
    }).toList();
  }

  void removeField(int key) {

      state = state.where((e) => e.key != key).toList();

  }

  void updateField(int key, {int? addonSizeId, int? addonId, double? price}) {
    state = state.map((field) {
      if (field.key == key) {
        return field.copyWith(
          addonSizeId: addonSizeId,
          addonId: addonId,
          price: price,
        );
      }
      return field;
    }).toList();
  }

  void updatePrice(int? addonSizeId, double newPrice, int key, int? addonId) {
    state = state.map((field) {
      if (field.key == key) {
        return field.copyWith(
          addonSizeId: addonSizeId,
          addonId: addonId,
          price: newPrice,
        );
      }
      return field;
    }).toList();
  }


  List<int> get selectedAddonSizeIds =>
      state.map((e) => e.addonSizeId).whereType<int>().toList();
}

final optionFieldProvider =
    StateNotifierProvider.autoDispose<OptionFieldNotifier, List<OptionFieldData>>(
        (ref) => OptionFieldNotifier());

//
// class OptionFieldNotifier extends StateNotifier<List<int>> {
//   OptionFieldNotifier() : super([0]);
//   int _counter = 1;
//
//   void addField() {
//      {
//       state = [...state, _counter++];
//     }
//   }
//
//   void removeField(int key) {
//     if (state.length > 1) {
//       state = state.where((element) => element != key).toList();
//     }
//   }
// }
//
// final optionFieldProvider =
//     StateNotifierProvider<OptionFieldNotifier, List<int>>((ref) => OptionFieldNotifier());
