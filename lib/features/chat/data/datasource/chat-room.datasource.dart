import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electric_station_chat_demo/core/models/user.dart';
import 'package:electric_station_chat_demo/core/vendors/firebase.dart';
import 'package:electric_station_chat_demo/features/chat/domain/models/chat-message.dart';

class ChatRoomDatasource {
  final FirebaseVendor firebaseVendor;

  const ChatRoomDatasource(this.firebaseVendor);

  Stream<QuerySnapshot> getChats(String roomID) {
    return this.firebaseVendor.firestore.collection("/$roomID/").snapshots();
  }

  Future<DocumentReference> sendMessage(
      String roomID, ChatMessageModel message) {
    return this
        .firebaseVendor
        .firestore
        .collection("/$roomID/")
        .add(message.toMap());
  }
}
