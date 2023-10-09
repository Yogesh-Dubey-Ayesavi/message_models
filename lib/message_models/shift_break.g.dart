// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_break.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftBreak _$ShiftBreakFromJson(Map<String, dynamic> json) => ShiftBreak(
      ending_time: DateTime.parse(json['ending_time'] as String),
      starting_time: DateTime.parse(json['starting_time'] as String),
      is_meal_break: json['is_meal_break'] as bool,
      is_paid: json['is_paid'] as bool,
    );

Map<String, dynamic> _$ShiftBreakToJson(ShiftBreak instance) =>
    <String, dynamic>{
      'starting_time': instance.starting_time.toIso8601String(),
      'ending_time': instance.ending_time.toIso8601String(),
      'is_meal_break': instance.is_meal_break,
      'is_paid': instance.is_paid,
    };
