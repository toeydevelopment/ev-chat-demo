import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-message.dart';

abstract class ChatRoomRepository {
  Stream<List<ChatMessageModel>> getChats(String roomID);
  Future<void> sendMessage(String roomID, ChatMessageModel message);
}
