import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

/// All possible roles user can have.
enum Role { member, admin, moderator }

final system = ChatUser(id: Uuid().v4(), firstName: 'System');

/// A class that represents user.
@JsonSerializable()
@immutable
abstract class ChatUser extends Equatable {
  /// Creates a user.
  const ChatUser._({
    this.createdAt,
    this.firstName,
    required this.id,
    this.imageUrl,
    this.dob,
    this.email,
    this.phone,
    this.username,
    this.lastName,
    this.lastSeen,
    this.metadata,
    this.role,
    this.updatedAt,
  });

  const factory ChatUser({
    int? createdAt,
    String? firstName,
    required String id,
    String? imageUrl,
    String? lastName,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
    String? dob,
    String? phone,
    String? email,
    String? username,
  }) = _User;

  /// Creates user from a map (decoded JSON).
  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);

  /// Created user timestamp, in ms.
  final int? createdAt;

  /// First name of the user.
  final String? firstName;

  /// Unique ID of the user.
  final String id;

  /// Remote image URL representing user's avatar.
  final String? imageUrl;

  /// Last name of the user.
  final String? lastName;

  /// Timestamp when user was last visible, in ms.
  final int? lastSeen;

  /// Additional custom metadata or attributes related to the user.
  final Map<String, dynamic>? metadata;

  /// ChatUser [Role].
  final Role? role;

  /// Updated user timestamp, in ms.
  final int? updatedAt;

  /// For storing username
  final String? username;

  /// For storing user's date of birth
  final String? dob;

  /// User's email
  final String? email;

  /// user's phone number
  final String? phone;

  /// Equatable props.
  @override
  List<Object?> get props => [
        createdAt,
        firstName,
        id,
        imageUrl,
        lastName,
        dob,
        phone,
        username,
        email,
        lastSeen,
        metadata,
        updatedAt,
      ];

  ChatUser copyWith({
    int? createdAt,
    String? firstName,
    String? id,
    String? imageUrl,
    String? lastName,
    String? dob,
    String? phone,
    String? email,
    String? username,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  });

  /// Converts user to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);
}

/// A utility class to enable better copyWith.
class _User extends ChatUser {
  const _User({
    super.createdAt,
    super.firstName,
    required super.id,
    super.imageUrl,
    super.lastName,
    super.lastSeen,
    super.metadata,
    super.role,
    super.dob,
    super.email,
    super.phone,
    super.username,
    super.updatedAt,
  }) : super._();

  @override
  // CopyWith method
  ChatUser copyWith({
    int? createdAt,
    String? firstName,
    String? id,
    String? imageUrl,
    String? lastName,
    String? dob,
    String? phone,
    String? email,
    String? username,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  }) {
    return _User(
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      username: username ?? this.username,
      lastSeen: lastSeen ?? this.lastSeen,
      metadata: metadata ?? this.metadata,
      role: role ?? this.role,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
