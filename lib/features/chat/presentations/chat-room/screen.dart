import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electric_station_chat_demo/core/models/user.dart';
import 'package:electric_station_chat_demo/core/services-locator/main.dart';
import 'package:electric_station_chat_demo/core/util/chat-room-id-generator.dart';
import 'package:electric_station_chat_demo/core/util/chat-room-username-extractor.dart';
import 'package:electric_station_chat_demo/core/vendors/firebase.dart';
import 'package:electric_station_chat_demo/core/vendors/location.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-message.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-room.dart';
import 'package:electric_station_chat_demo/features/chat/domain/repository/chat-room.repository.dart';
import 'package:electric_station_chat_demo/mock-data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/chat-bar.dart';
import 'widgets/chat-bubble.dart';
import 'widgets/chat-text-field.dart';

part 'provider.dart';

class ChatRoomPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = useProvider(changeNotifierProvider);
    chatProvider.initRoom(MockData.user1, MockData.user2);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color(0xFFFEFEFE),
        appBar: ChatBarWidget(),
        body: Column(
          children: [
            Flexible(
              child: StreamBuilder<List<ChatMessageModel>>(
                stream: chatProvider.getChat(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ChatMessageModel>> _) {
                  if (_.connectionState == ConnectionState.active) {
                    return ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      children: _.data.map(
                        (e) {
                          return ChatBubbleWidget(
                            messageType: e.messageType == "TEXT"
                                ? EBubbleMessageType.TEXT
                                : EBubbleMessageType.LOCATION,
                            type: chatProvider.myUser.username == e.sendBy
                                ? BubbleType.sendBubble
                                : BubbleType.receiverBubble,
                            message: e.message,
                          );
                        },
                      ).toList(),
                    );
                  } else {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                },
              ),
            ),
            ChatTextFieldWidget(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
