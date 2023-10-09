
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'shift_break.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class ShiftBreak {
  const ShiftBreak({
    required this.ending_time,
    required this.starting_time,
    required this.is_meal_break,
    required this.is_paid,
  });

  final DateTime starting_time;
  final DateTime ending_time;
  final bool is_meal_break;
  final bool is_paid;

  factory ShiftBreak.fromJson(Map<String, dynamic> json) =>
      _$ShiftBreakFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftBreakToJson(this);
}
