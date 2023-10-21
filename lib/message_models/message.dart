  import 'package:equatable/equatable.dart';
  import 'package:json_annotation/json_annotation.dart';
  import 'package:message_models/message_models/reaction.dart';
  import 'package:message_models/message_models/system_message/system_message.dart';
  import 'package:message_models/message_models/text_message/text_message.dart';
  import 'package:message_models/message_models/user.dart';
  import 'package:meta/meta.dart';
  import '../custom_converters/chat_user_converter.dart';
  import '../repos/user_repository.dart';
  import 'audio_message/audio_message.dart';
  import 'custom_message/custom_message.dart';
  import 'enumeration.dart';
  import 'image_message/image_message.dart';
  import 'shift_message/shift_message.dart';

  /// All possible message types.

  /// All possible statuses message can have.

  /// An abstract class that contains all variables and methods
  /// every message will have.
  @immutable
  abstract class Message extends Equatable {
    Message({
      required this.author,
      required this.createdAt,
      required this.id,
      this.metadata,
      this.remoteId,
      this.repliedMessage,
      this.roomId,
      this.showStatus,
      DeliveryStatus? status,
      required this.type,
      this.updatedAt,
      this.reaction,
    }) {
      this.status = status ?? DeliveryStatus.pending;
    }

    /// Creates a particular message from a map (decoded JSON).
    /// Type is determined by the `type` field.
    factory Message.fromJson(Map<String, dynamic> json,
        {IUserRepository? userRepository}) {
      final type = MessageType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => MessageType.unsupported,
      );

      switch (type) {
        case MessageType.custom:
          return CustomMessage.fromJson(json, userRepository: userRepository);
        case MessageType.voice:
          return AudioMessage.fromJson(json, userRepository: userRepository);
        case MessageType.image:
          return ImageMessage.fromJson(json, userRepository: userRepository);
        case MessageType.text:
          return TextMessage.fromJson(json, userRepository: userRepository);
        case MessageType.shift:
          return ShiftMessage.fromJson(json, userRepository: userRepository);
        case MessageType.system:
          return SystemMessage.fromJson(json, userRepository: userRepository);
        default:
          return TextMessage(
              author: ChatUser.fromJson(json['author']),
              createdAt: json["createdAt"],
              id: json['id'],
              text: 'Message Unsupported');
      }
    }

    /// ChatUser who sent this message.
    @ChatUserConverter()
    final ChatUser author;

    /// Created message timestamp, in ms.
    final int createdAt;

    /// Unique ID of the message.
    final String id;

    /// Additional custom metadata or attributes related to the message.
    final Map<String, dynamic>? metadata;

    /// Unique ID of the message received from the backend.
    final String? remoteId;

    /// Message that is being replied to with the current message.

    final Message? repliedMessage;

    /// ID of the room where this message is sent.
    final String? roomId;

    /// Show status or not.
    final bool? showStatus;

    /// Message [DeliveryStatus].
    late final DeliveryStatus status;

    /// [MessageType].
    final MessageType type;

    /// Updated message timestamp, in ms.
    final int? updatedAt;

    /// Reactions by the user.
    final Reaction? reaction;

    /// Creates a copy of the message with an updated data.
    Message copyWith({
      ChatUser? author,
      int? createdAt,
      String? id,
      Map<String, dynamic>? metadata,
      String? remoteId,
      Message? repliedMessage,
      String? roomId,
      bool? showStatus,
      Reaction? reaction,
      DeliveryStatus? status,
      int? updatedAt,
    });

    /// Converts a particular message to the map representation, serializable to JSON.
    Map<String, dynamic> toJson();
  }
