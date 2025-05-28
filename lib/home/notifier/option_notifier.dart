import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionEntry {
  String name;
  String value;

  OptionEntry({required this.name, required this.value});
}

class OptionsNotifier extends StateNotifier<List<OptionEntry>> {
  OptionsNotifier() : super([OptionEntry(name: '', value: '')]);

  void add() {
    state = [...state, OptionEntry(name: '', value: '')];
  }

  void remove(int index) {
    if (state.length > 1) {
      final newList = [...state]..removeAt(index);
      state = newList;
    }
  }

  void updateName(int index, String newName) {
    final updated = [...state];
    updated[index] = OptionEntry(name: newName, value: updated[index].value);
    state = updated;
  }

  void updateValue(int index, String newValue) {
    final updated = [...state];
    updated[index] = OptionEntry(name: updated[index].name, value: newValue);
    state = updated;
  }
}

final optionsProvider =
    StateNotifierProvider<OptionsNotifier, List<OptionEntry>>((ref) => OptionsNotifier());
