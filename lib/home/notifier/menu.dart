import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/menu_state.dart';
import 'package:java_go/home/model/menu_items.dart';

class MenuNotifier extends StateNotifier<MenuState> {
  MenuNotifier() : super(MenuState(menuItems: []));

  void setMenuItems(List<MenuItem> items) {
    state = state.copyWith(menuItems: items, currentPage: 1);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= state.totalPages) {
      state = state.copyWith(currentPage: page);
    }
  }

  void nextPage() {
    if (state.currentPage < state.totalPages) {
      state = state.copyWith(currentPage: state.currentPage + 1);
    }
  }

  void prevPage() {
    if (state.currentPage > 1) {
      state = state.copyWith(currentPage: state.currentPage - 1);
    }
  }
}
final menuProvider = StateNotifierProvider<MenuNotifier, MenuState>((ref) {
  return MenuNotifier();
});

