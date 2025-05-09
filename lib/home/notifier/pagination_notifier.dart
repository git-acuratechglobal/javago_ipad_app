import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationNotifier extends StateNotifier<int> {
  PaginationNotifier() : super(0); // Start from page 0

  void goToPage(int page) => state = page;
  void nextPage(int totalPages) {
    if (state < totalPages - 1) state++;
  }

  void previousPage() {
    if (state > 0) state--;
  }
}

final paginationProvider = StateNotifierProvider<PaginationNotifier, int>((ref) {
  return PaginationNotifier();
});
