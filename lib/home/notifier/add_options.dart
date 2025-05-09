import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionFieldNotifier extends StateNotifier<List<int>> {
  OptionFieldNotifier() : super([0]);
  int _counter = 1;

  void addField() {
     {
      state = [...state, _counter++];
    }
  }

  void removeField(int key) {
    if (state.length > 1) {
      state = state.where((element) => element != key).toList();
    }
  }
}

final optionFieldProvider =
    StateNotifierProvider<OptionFieldNotifier, List<int>>((ref) => OptionFieldNotifier());
