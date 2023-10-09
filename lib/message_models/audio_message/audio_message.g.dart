// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioMessage _$AudioMessageFromJson(
        Map<String, dynamic> json, IUserRepository? repo) =>
    AudioMessage(
      author: const ChatUserConverter().fromJson(
          json['author'] as Map<String, dynamic>,
          userRepository: repo),
      id: json['id'] as String,
      duration: json['duration'] as int,
      name: json['name'] as String,
      size: json['size'] as num,
      createdAt: json['createdAt'] as int,
      reaction: json['reaction'] == null
          ? null
          : Reaction.fromJson(json['reaction'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      remoteId: json['remoteId'] as String?,
      repliedMessage: json['repliedMessage'] == null
          ? null
          : Message.fromJson(json['repliedMessage'] as Map<String, dynamic>,
              userRepository: repo),
      roomId: json['roomId'] as String?,
      showStatus: json['showStatus'] as bool?,
      status: $enumDecodeNullable(_$DeliveryStatusEnumMap, json['status']),
      uri: json['uri'] as String,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']),
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$AudioMessageToJson(AudioMessage instance) =>
    <String, dynamic>{
      'author': const ChatUserConverter().toJson(instance.author),
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
      'uri': instance.uri,
      'size': instance.size,
      'name': instance.name,
      'duration': instance.duration,
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
