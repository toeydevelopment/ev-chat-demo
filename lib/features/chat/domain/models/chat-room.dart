import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'chat-message.dart';

class ChatRoomModel {
  final String roomID;
  final List<ChatMessageModel> messages;
  ChatRoomModel({
    this.roomID,
    this.messages,
  });

  ChatRoomModel copyWith({
    String roomID,
    List<ChatMessageModel> messages,
  }) {
    return ChatRoomModel(
      roomID: roomID ?? this.roomID,
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'roomID': roomID,
      'messages': messages?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChatRoomModel(
      roomID: map['roomID'],
      messages: List<ChatMessageModel>.from(
          map['messages']?.map((x) => ChatMessageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoomModel.fromJson(String source) =>
      ChatRoomModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChatRoomModel(roomID: $roomID, messages: $messages)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChatRoomModel &&
        o.roomID == roomID &&
        listEquals(o.messages, messages);
  }

  @override
  int get hashCode => roomID.hashCode ^ messages.hashCode;
}
