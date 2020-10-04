import 'dart:convert';

import 'package:flutter/material.dart';

class ChatMessageModel {
  final String sendBy;
  final int timeStamp;
  final String messageType;
  final String message;

  const ChatMessageModel({
    @required this.sendBy,
    @required this.timeStamp,
    @required this.messageType,
    this.message,
  });

  ChatMessageModel copyWith({
    String sendBy,
    int timeStamp,
    String messageType,
    String message,
  }) {
    return ChatMessageModel(
      sendBy: sendBy ?? this.sendBy,
      timeStamp: timeStamp ?? this.timeStamp,
      messageType: messageType ?? this.messageType,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sendBy': sendBy,
      'timeStamp': timeStamp,
      'messageType': messageType,
      'message': message,
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChatMessageModel(
      sendBy: map['sendBy'],
      timeStamp: map['timeStamp'],
      messageType: map['messageType'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) =>
      ChatMessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessageModel(sendBy: $sendBy, timeStamp: $timeStamp, messageType: $messageType, message: $message)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChatMessageModel &&
        o.sendBy == sendBy &&
        o.timeStamp == timeStamp &&
        o.messageType == messageType &&
        o.message == message;
  }

  @override
  int get hashCode {
    return sendBy.hashCode ^
        timeStamp.hashCode ^
        messageType.hashCode ^
        message.hashCode;
  }
}
