import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:message_models/message_models/shift_break.dart';
import 'package:message_models/message_models/user.dart';
import 'package:meta/meta.dart';
import 'enumeration.dart';

part 'shift.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class Shift extends Equatable {
  const Shift(
      {required this.category,
      required this.location,
      required this.date,
      required this.id,
      required this.starting_time,
      required this.ending_time,
      required this.creator,
      this.description,
      this.breaks = const [],
      this.tags = const [],
      this.status = ShiftStatus.pending,
      required this.users});

  final String category;
  final String id;
  final String location;
  final DateTime ending_time;
  final DateTime date;
  final DateTime starting_time;
  final String? description;
  final ShiftStatus status;
  final ChatUser creator;
  final List<ShiftBreak> breaks;
  final List<String> tags;
  final List<ChatUser> users;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);

  Shift copyWith({
    String? category,
    String? location,
    DateTime? starting_time,
    DateTime? ending_time,
    ShiftStatus? status,
    List<ShiftBreak>? breaks,
    ChatUser? creator,
    String? description,
    DateTime? date,
    String? id,
    List<String>? tags,
    List<ChatUser>? users,
  }) {
    return Shift(
      date: date ?? this.date,
      id: id ?? this.id,
      category: category ?? this.category,
      location: location ?? this.location,
      creator: creator ?? this.creator,
      starting_time: starting_time ?? this.starting_time,
      ending_time: ending_time ?? this.ending_time,
      status: status ?? this.status,
      breaks: breaks ?? this.breaks,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      users: users ?? this.users,
    );
  }

  @override
  get props => [id];
}
