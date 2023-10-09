// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) => ChatUser(
      createdAt: json['createdAt'] as int?,
      firstName: json['firstName'] as String?,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String?,
      lastName: json['lastName'] as String?,
      lastSeen: json['lastSeen'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      updatedAt: json['updatedAt'] as int?,
      dob: json['dob'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$ChatUserToJson(ChatUser instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'firstName': instance.firstName,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'lastName': instance.lastName,
      'lastSeen': instance.lastSeen,
      'metadata': instance.metadata,
      'role': _$RoleEnumMap[instance.role],
      'updatedAt': instance.updatedAt,
      'username': instance.username,
      'dob': instance.dob,
      'email': instance.email,
      'phone': instance.phone,
    };

const _$RoleEnumMap = {
  Role.member: 'member',
  Role.admin: 'admin',
  Role.moderator: 'moderator',
};
