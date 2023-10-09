import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import '../../custom_converters/chat_user_converter.dart';
import '../../repos/user_repository.dart';
import '../enumeration.dart';
import '../message.dart';
import '../reaction.dart';
import '../user.dart';
part 'text_message.g.dart';

/// A class that represents text message.
@JsonSerializable(explicitToJson: true)
@immutable
abstract class TextMessage extends Message {
  /// Creates a text message.
  TextMessage._({
    required super.author,
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
  }) : super(type: MessageType.text);

  factory TextMessage({
    required ChatUser author,
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
  }) = _TextMessage;

  /// Creates a text message from a map (decoded JSON).
  factory TextMessage.fromJson(Map<String, dynamic> json,{IUserRepository? userRepository}) =>
      _$TextMessageFromJson(json,userRepository);

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
        text,
        status,
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
  Map<String, dynamic> toJson() => _$TextMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _TextMessage extends TextMessage {
  _TextMessage({
    required super.author,
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
      _TextMessage(
        author: author ?? this.author,
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
