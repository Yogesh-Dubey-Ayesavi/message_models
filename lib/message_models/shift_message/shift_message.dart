import 'package:json_annotation/json_annotation.dart' as ann;
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import '../enumeration.dart';
import '../message.dart';
import '../reaction.dart';
import '../shift.dart';
import '../user.dart';
part 'shift_message.g.dart';

/// A class that represents text message.
@ann.JsonSerializable(explicitToJson: true)
@immutable
abstract class ShiftMessage extends Message {
  /// Creates a text message.
  ShiftMessage._({
     super.author,
    required super.createdAt,
    required super.id,
    required this.shift,
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
  }) : super(type: MessageType.shift);

  factory ShiftMessage({
     ChatUser author,
    required String id,
    required Shift shift,
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
  }) = _ShiftMessage;

  /// Creates a text message from a map (decoded JSON).
  factory ShiftMessage.fromJson(Map<String, dynamic> json, ChatUser author,
      {Message? repliedMessage}) {
    final _instance = _$ShiftMessageFromJson(json);
    _instance.author = author;
    _instance.repliedMessage = repliedMessage;
    return _instance;
  }

  final Shift shift;

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
        shift,
        updatedAt,
      ];

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    Shift? shift,
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
  Map<String, dynamic> toJson() => _$ShiftMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _ShiftMessage extends ShiftMessage {
  _ShiftMessage({
    super.author,
    required super.createdAt,
    required super.id,
    required super.shift,
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
    int? duration,
    String? location,
    Shift? shift,
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
      _ShiftMessage(
        shift: shift ?? this.shift,
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
