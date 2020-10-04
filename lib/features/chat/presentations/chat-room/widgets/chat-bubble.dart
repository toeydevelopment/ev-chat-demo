import 'package:electric_station_chat_demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:url_launcher/url_launcher.dart';

enum EBubbleMessageType {
  TEXT,
  LOCATION,
}

class ChatBubbleWidget extends StatelessWidget {
  final EBubbleMessageType messageType;
  final BubbleType type;
  final String message;

  const ChatBubbleWidget({
    Key key,
    @required this.messageType,
    @required this.type,
    @required this.message,
  }) : super(key: key);

  Widget _buildReceiver(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: kPrimaryColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: this.messageType == EBubbleMessageType.LOCATION
            ? FlatButton.icon(
                onPressed: () {
                  launch(
                      "https://maps.google.com/?q=${this.message.split('#')[0]},${this.message.split('#')[1]}");
                },
                icon: Icon(
                  Icons.location_history,
                  color: Colors.white,
                ),
                label: Text(
                  "Current Address",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                this.message,
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }

  Widget _buildSender(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: kGreyColor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: this.messageType == EBubbleMessageType.LOCATION
            ? FlatButton.icon(
                onPressed: () {
                  launch(
                      "https://maps.google.com/?q=${this.message.split('#')[0]},${this.message.split('#')[1]}");
                },
                icon: Icon(Icons.location_history),
                label: Text("Current Address"),
              )
            : Text(
                this.message,
                style: TextStyle(color: Colors.black),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.type == BubbleType.sendBubble
        ? this._buildSender(context)
        : this._buildReceiver(context);
  }
}
