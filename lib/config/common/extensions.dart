import 'package:flutter/material.dart';
import 'package:java_go/home/model/menu_items_data.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
          content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )),
    );
  }
}



extension SortByDate on List<Datum> {
  List<Datum> sortByLatest() {
    final sorted = [...this];
    sorted.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sorted;
  }
}


extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}