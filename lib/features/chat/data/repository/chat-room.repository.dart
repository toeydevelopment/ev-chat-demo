import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electric_station_chat_demo/features/chat/data/datasource/chat-room.datasource.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-message.dart';
import 'package:electric_station_chat_demo/features/chat/domain/repository/chat-room.repository.dart';
import 'package:flutter/material.dart';

class ChatRoomRepositoryImpl implements ChatRoomRepository {
  final ChatRoomDatasource datasource;

  const ChatRoomRepositoryImpl({@required this.datasource});

  @override
  Stream<List<ChatMessageModel>> getChats(String roomID) {
    return this.datasource.getChats(roomID).map(
          (event) => event.docs
              .map(
                (e) => ChatMessageModel.fromMap(
                  e.data(),
                ),
              )
              .toList()
                ..sort((a, b) => b.timeStamp.compareTo(a.timeStamp)),
        );
  }

  @override
  Future<void> sendMessage(String roomID, ChatMessageModel message) async {
    await this.datasource.sendMessage(roomID, message);
  }
}
