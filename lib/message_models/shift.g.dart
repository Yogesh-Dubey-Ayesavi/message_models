// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      category: json['category'] as String,
      location: json['location'] as String,
      date: DateTime.parse(json['date'] as String),
      id: json['id'] as String,
      starting_time: DateTime.parse(json['starting_time'] as String),
      ending_time: DateTime.parse(json['ending_time'] as String),
      creator: ChatUser.fromJson(json['creator'] as Map<String, dynamic>),
      description: json['description'] as String?,
      breaks: (json['breaks'] as List<dynamic>?)
              ?.map((e) => ShiftBreak.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      status: $enumDecodeNullable(_$ShiftStatusEnumMap, json['status']) ??
          ShiftStatus.pending,
      users: (json['users'] as List<dynamic>)
          .map((e) => ChatUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'category': instance.category,
      'id': instance.id,
      'location': instance.location,
      'ending_time': instance.ending_time.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'starting_time': instance.starting_time.toIso8601String(),
      'description': instance.description,
      'status': _$ShiftStatusEnumMap[instance.status]!,
      'creator': instance.creator.toJson(),
      'breaks': instance.breaks.map((e) => e.toJson()).toList(),
      'tags': instance.tags,
      'users': instance.users.map((e) => e.toJson()).toList(),
    };

const _$ShiftStatusEnumMap = {
  ShiftStatus.ongoing: 'ongoing',
  ShiftStatus.upcoming: 'upcoming',
  ShiftStatus.late: 'late',
  ShiftStatus.started:'started',
  ShiftStatus.ended: 'ended',
  ShiftStatus.shiftbreak: 'shiftbreak',
  ShiftStatus.review: 'review',
  ShiftStatus.pending: 'pending',
  ShiftStatus.completed: 'completed',
  ShiftStatus.paid: 'paid',
};
