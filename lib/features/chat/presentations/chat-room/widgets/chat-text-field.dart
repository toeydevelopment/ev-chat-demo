import 'package:electric_station_chat_demo/constants.dart';
import 'package:electric_station_chat_demo/core/services-locator/main.dart';
import 'package:electric_station_chat_demo/core/vendors/firebase.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-message.dart';
import 'package:electric_station_chat_demo/features/chat/domain/repository/chat-room.repository.dart';
import 'package:electric_station_chat_demo/features/chat/presentations/chat-room/screen.dart';
import 'package:electric_station_chat_demo/mock-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/all.dart';

class ChatTextFieldWidget extends HookWidget {
  final textEditor = useTextEditingController();
  ChatTextFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = useProvider(changeNotifierProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditor,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    chatProvider.sendLatLngMessage();
                  },
                ),
                hintText: "Type yor message.....",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: kPrimaryColor,
              ),
              onPressed: () {
                chatProvider.sendMessage(this.textEditor.text);
                this.textEditor.text = "";
              },
            ),
          )
        ],
      ),
    );
  }
}
