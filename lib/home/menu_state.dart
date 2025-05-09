import 'package:java_go/home/model/menu_items.dart';

class MenuState {
  final List<MenuItem> menuItems;
  final int currentPage;
  final int itemsPerPage;

  MenuState({
    required this.menuItems,
    this.currentPage = 1,
    this.itemsPerPage = 5,
  });

  int get totalPages => (menuItems.length / itemsPerPage).ceil();

  List<MenuItem> get paginatedItems {
    final start = (currentPage - 1) * itemsPerPage;
    final end = start + itemsPerPage;
    return menuItems.sublist(start, end > menuItems.length ? menuItems.length : end);
  }

  MenuState copyWith({
    List<MenuItem>? menuItems,
    int? currentPage,
    int? itemsPerPage,
  }) {
    return MenuState(
      menuItems: menuItems ?? this.menuItems,
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }
}
