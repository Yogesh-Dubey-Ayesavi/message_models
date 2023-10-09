import 'package:json_annotation/json_annotation.dart';
import 'package:message_models/repos/user_repository.dart';

import '../message_models/user.dart';

class ChatUserConverter
    implements JsonConverter<ChatUser, Map<String, dynamic>> {
 
   const ChatUserConverter();
 
  @override
  ChatUser fromJson(Map<String, dynamic> json,
          {IUserRepository? userRepository}) =>
      userRepository?.getUser(json["id"], json) ?? ChatUser.fromJson(json);

  @override
  Map<String, dynamic> toJson(ChatUser object) => object.toJson();
}
