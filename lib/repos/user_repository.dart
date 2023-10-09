import 'package:message_models/message_models.dart';

abstract class IUserRepository {
  // Add a user to the repository.
  void add(ChatUser user);

  // Remove a user from the repository based on a filter.
  void removeWhere(bool Function(ChatUser user) filter);

  // Get users based on a filter.
  List<ChatUser> getUsers(bool Function(ChatUser user) filter);

  // Get a user by ID, or create and add it if not found.
  ChatUser getUser(String id, Map<String, dynamic> json);
}
