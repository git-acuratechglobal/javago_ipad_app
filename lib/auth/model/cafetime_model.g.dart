// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafetime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CafeDayTimeImpl _$$CafeDayTimeImplFromJson(Map<String, dynamic> json) =>
    _$CafeDayTimeImpl(
      day: json['day'] as String,
      openingTime:
          const TimeOfDayConverter().fromJson(json['openingTime'] as String),
      closingTime:
          const TimeOfDayConverter().fromJson(json['closingTime'] as String),
      isActive: (json['is_active'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$CafeDayTimeImplToJson(_$CafeDayTimeImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'openingTime': const TimeOfDayConverter().toJson(instance.openingTime),
      'closingTime': const TimeOfDayConverter().toJson(instance.closingTime),
      'is_active': instance.isActive,
    };
