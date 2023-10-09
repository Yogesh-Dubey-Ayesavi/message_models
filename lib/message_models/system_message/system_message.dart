import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import '../enumeration.dart';
import '../message.dart';
import '../reaction.dart';
import '../user.dart';
part 'system_message.g.dart';

/// A class that represents text message.
@JsonSerializable(explicitToJson: true)
@immutable
abstract class SystemMessage extends Message {
  /// Creates a text message.
  SystemMessage._({
    required super.createdAt,
    required super.id,
    super.reaction,
    super.metadata,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    required this.text,
    MessageType? type,
    super.updatedAt,
  }) : super(type: MessageType.system, author: const ChatUser(id: "system"));

  factory SystemMessage({
    required String id,
    required int createdAt,
    Reaction? reaction,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    DeliveryStatus? status,
    required String text,
    MessageType? type,
    int? updatedAt,
  }) = _SystemMessage;

  /// Creates a text message from a map (decoded JSON).
  factory SystemMessage.fromJson(Map<String, dynamic> json, ChatUser author,
      {Message? repliedMessage}) {
    final _instance = _$SystemMessageFromJson(json);
    _instance.repliedMessage = null;
    return _instance;
  }

  /// ChatUser's message.
  final String text;

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
        text,
        updatedAt,
      ];

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Reaction? reaction,
    bool? showStatus,
    DeliveryStatus? status,
    String? text,
    int? updatedAt,
  });

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$SystemMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _SystemMessage extends SystemMessage {
  _SystemMessage({
    required super.createdAt,
    required super.id,
    super.metadata,
    super.reaction,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    required super.text,
    super.type,
    super.updatedAt,
  }) : super._();

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    Reaction? reaction,
    bool? showStatus,
    DeliveryStatus? status,
    String? text,
    int? updatedAt,
  }) =>
      _SystemMessage(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        metadata: metadata ?? this.metadata,
        reaction: reaction ?? this.reaction,
        remoteId: remoteId ?? this.remoteId,
        repliedMessage: repliedMessage ?? this.repliedMessage,
        roomId: roomId ?? this.roomId,
        showStatus: showStatus ?? this.showStatus,
        status: status ?? this.status,
        text: text ?? this.text,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
