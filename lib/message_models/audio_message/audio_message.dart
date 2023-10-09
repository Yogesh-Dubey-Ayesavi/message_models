import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../custom_converters/chat_user_converter.dart';
import '../../repos/user_repository.dart';
import '../enumeration.dart';
import '../message.dart';
import '../reaction.dart';
import '../user.dart';
part 'audio_message.g.dart';

/// A class that represents uri message.
@JsonSerializable(explicitToJson: true)
@immutable
abstract class AudioMessage extends Message {
  /// Creates a uri message.
  AudioMessage._({
    required super.author,
    required super.createdAt,
    required super.id,
    required this.name,
    required this.duration,
    required this.size,
    super.reaction,
    super.metadata,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    required this.uri,
    MessageType? type,
    super.updatedAt,
  }) : super(type: MessageType.voice);

  factory AudioMessage({
    required ChatUser author,
    required String id,
    required int duration,
    required String name,
    required num size,
    required int createdAt,
    Reaction? reaction,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    DeliveryStatus? status,
    required String uri,
    MessageType? type,
    int? updatedAt,
  }) = _AudioMessage;

  factory AudioMessage.fromJson(Map<String, dynamic> json,{IUserRepository? userRepository}) =>
      _$AudioMessageFromJson(json,userRepository);

  /// ChatUser's message.
  final String uri;

  final num size;

  final String name;

  final int duration;

  /// Equatable props.
  @override
  List<Object?> get props => [
        author,
        createdAt,
        id,
        metadata,
        remoteId,
        repliedMessage,
        roomId,
        status,
        uri,
        updatedAt,
      ];

  @override
  Message copyWith({
    ChatUser? author,
    String? name,
    num? size,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Reaction? reaction,
    bool? showStatus,
    DeliveryStatus? status,
    String? uri,
    int? updatedAt,
  });

  /// Converts a uri message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$AudioMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _AudioMessage extends AudioMessage {
  _AudioMessage({
    required super.author,
    required super.createdAt,
    required super.id,
    required super.name,
    required super.size,
    super.metadata,
    super.reaction,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    required super.duration,
    required super.uri,
    super.type,
    super.updatedAt,
  }) : super._();

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    String? id,
    int? duration,
    String? name,
    num? size,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Reaction? reaction,
    bool? showStatus,
    DeliveryStatus? status,
    String? uri,
    int? updatedAt,
  }) =>
      _AudioMessage(
        author: author ?? this.author,
        name: name ?? this.name,
        duration: duration ?? this.duration,
        size: size ?? this.size,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        metadata: metadata ?? this.metadata,
        reaction: reaction ?? this.reaction,
        remoteId: remoteId ?? this.remoteId,
        repliedMessage: repliedMessage ?? this.repliedMessage,
        roomId: roomId ?? this.roomId,
        showStatus: showStatus ?? this.showStatus,
        status: status ?? this.status,
        uri: uri ?? this.uri,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
