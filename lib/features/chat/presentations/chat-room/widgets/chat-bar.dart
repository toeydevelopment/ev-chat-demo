import 'package:chatbar/chatbar.dart';
import 'package:electric_station_chat_demo/features/chat/presentations/chat-room/screen.dart';
import 'package:electric_station_chat_demo/mock-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class ChatBarWidget extends HookWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final chatProvider = useProvider(changeNotifierProvider);

    return ChatBar(
      username: chatProvider.getOppositeUser(),
      usernamestyle: TextStyle(
        color: Colors.blueAccent,
        fontSize: 22,
      ),
      actions: [],
      color: const Color(0xFFFEFEFE),
      backbuttoncolor: Colors.black,
      height: 50,
      profilePic: Image(
        image: NetworkImage(
          MockData.avatarSender,
        ),
        fit: BoxFit.cover,
        height: 50,
        width: 50,
      ),
      status: Text(
        "Online",
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}
