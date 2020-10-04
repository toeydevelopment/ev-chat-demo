import 'package:electric_station_chat_demo/features/chat/presentations/chat-room/screen.dart';
import 'package:electric_station_chat_demo/mock-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';

class WelcomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = useProvider(changeNotifierProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                chatProvider.initMyUser(MockData.user1);
                Get.to(ChatRoomPage());
              },
              child: Text("FOO"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              chatProvider.initMyUser(MockData.user2);
              Get.to(ChatRoomPage());
            },
            child: Text("BAR"),
          ),
        ],
      ),
    );
  }
}
