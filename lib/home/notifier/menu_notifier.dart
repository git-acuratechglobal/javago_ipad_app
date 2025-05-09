import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizePrice {
  String size;
  String price;

  SizePrice({required this.size, required this.price});
}

class SizePriceNotifier extends StateNotifier<List<SizePrice>> {
  SizePriceNotifier() : super([SizePrice(size: '', price: '')]);

  void add() {
    state = [...state, SizePrice(size: '', price: '')];
  }

  void remove(int index) {
    if (state.length > 1) {
      final newList = [...state]..removeAt(index);
      state = newList;
    }
  }

  void updateSize(int index, String newSize) {
    final updated = [...state];
    updated[index] = SizePrice(size: newSize, price: updated[index].price);
    state = updated;
  }

  void updatePrice(int index, String newPrice) {
    final updated = [...state];
    updated[index] = SizePrice(size: updated[index].size, price: newPrice);
    state = updated;
  }
}


final sizePriceProvider =
    StateNotifierProvider<SizePriceNotifier, List<SizePrice>>((ref) => SizePriceNotifier());
