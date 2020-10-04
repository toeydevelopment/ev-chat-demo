import 'package:electric_station_chat_demo/core/models/user.dart';

class ChatRoomIDGenerator {
  String call(UserModel user1, UserModel user2) {
    List<UserModel> users = [user1, user2];
    users.sort((a, b) => a.username.compareTo(b.username));
    return "${users[0].username.length * users[1].username.length}_${users[0].username}#${users[1].username}";
  }
}
