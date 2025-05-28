import 'package:flutter/material.dart';

class CafeDayTime {
  final String day;
  final TimeOfDay openingTime;
  final TimeOfDay closingTime;
  final int? isActive;
  CafeDayTime(
      {required this.day,
      required this.openingTime,
      required this.closingTime,
      this.isActive = 1});
}

String formatTime(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}
