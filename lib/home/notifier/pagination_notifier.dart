// pagination_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationNotifier extends StateNotifier<int> {
  PaginationNotifier() : super(1);

  void goToPage(int page) => state = page;

  void nextPage(int totalPages) {
    if (state < totalPages) state++;
  }

  void previousPage() {
    if (state > 1) state--;
  }
}

final paginationProvider = StateNotifierProvider<PaginationNotifier, int>((ref) {
  return PaginationNotifier();
});
