// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftMessage _$ShiftMessageFromJson(Map<String, dynamic> json) => ShiftMessage(
      id: json['id'] as String,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as int,
      reaction: json['reaction'] == null
          ? null
          : Reaction.fromJson(json['reaction'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      remoteId: json['remoteId'] as String?,
      roomId: json['roomId'] as String?,
      showStatus: json['showStatus'] as bool?,
      status: $enumDecodeNullable(_$DeliveryStatusEnumMap, json['status']),
      text: json['text'] as String,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$ShiftMessageToJson(ShiftMessage instance) =>
    <String, dynamic>{
      'author': instance.author.toJson(),
      'createdAt': instance.createdAt,
      'id': instance.id,
      'metadata': instance.metadata,
      'remoteId': instance.remoteId,
      'repliedMessage': instance.repliedMessage?.toJson(),
      'roomId': instance.roomId,
      'showStatus': instance.showStatus,
      'status': _$DeliveryStatusEnumMap[instance.status]!,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'updatedAt': instance.updatedAt,
      'reaction': instance.reaction?.toJson(),
      'shift': instance.shift.toJson(),
      'text': instance.text,
    };

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.error: 'error',
  DeliveryStatus.sending: 'sending',
  DeliveryStatus.sent: 'sent',
  DeliveryStatus.read: 'read',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.undelivered: 'undelivered',
  DeliveryStatus.pending: 'pending',
  DeliveryStatus.custom: 'custom',
};

const _$MessageTypeEnumMap = {
  MessageType.custom: 'custom',
  MessageType.image: 'image',
  MessageType.text: 'text',
  MessageType.unsupported: 'unsupported',
  MessageType.system: 'system',
  MessageType.voice: 'voice',
  MessageType.shift: 'shift',
};
