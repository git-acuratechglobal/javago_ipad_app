import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafetime_model.freezed.dart';
part 'cafetime_model.g.dart';

@freezed
abstract class CafeDayTime with _$CafeDayTime {
  const factory CafeDayTime({
    required String day,
    @TimeOfDayConverter() required TimeOfDay openingTime,
    @TimeOfDayConverter() required TimeOfDay closingTime,
    @JsonKey(name: 'is_active') @Default(1) int isActive,
  }) = _CafeDayTime;

  factory CafeDayTime.fromJson(Map<String, dynamic> json) => _$CafeDayTimeFromJson(json);
}

extension CafeDayTimeExtension on CafeDayTime {
  String get openTimeFormatted {
    return '${openingTime.hour.toString().padLeft(2, '0')}:${openingTime.minute.toString().padLeft(2, '0')}';
  }

  String get closeTimeFormatted {
    return '${closingTime.hour.toString().padLeft(2, '0')}:${closingTime.minute.toString().padLeft(2, '0')}';
  }
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(String json) {
    final parts = json.split(":");
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  @override
  String toJson(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}