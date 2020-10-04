import 'package:electric_station_chat_demo/core/models/user.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-room.dart';

class ChatRoomUsernameExtractor {
  String extractSender(
    ChatRoomModel room,
  ) {
    throw UnimplementedError();
  }

  String extractReceiver(
    ChatRoomModel room,
  ) {
    throw UnimplementedError();
  }

  String getChatUsername(ChatRoomModel room, UserModel user) {
    return room.roomID
        .split("_")[1]
        .split("#")
        .where(
          (element) => element == user.username,
        )
        .first;
  }

  String getChatOppositeUsername(ChatRoomModel room, UserModel user) {
    return room.roomID
        .split("_")[1]
        .split("#")
        .where(
          (element) => element != user.username,
        )
        .first;
  }
}
