part of "screen.dart";

final changeNotifierProvider =
    ChangeNotifierProvider<ChatProvider>((ref) => ChatProvider());

class ChatProvider with ChangeNotifier {
  ChatRoomModel room;
  UserModel myUser;

  void initMyUser(UserModel user) {
    this.myUser = user;
    this.notifyListeners();
  }

  void initRoom(UserModel user1, UserModel user2) {
    this.room = ChatRoomModel(
      roomID: sl<ChatRoomIDGenerator>()(user1, user2),
    );
  }

  sendLatLngMessage() async {
    final latlng = await sl<LocationVendor>().getCurrentLatLng();
    sl<ChatRoomRepository>().sendMessage(
      this.room.roomID,
      ChatMessageModel(
        sendBy: this.myUser.username,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        messageType: "LOCATION",
        message: "${latlng.lat}#${latlng.lng}",
      ),
    );
  }

  String getOppositeUser() {
    return sl<ChatRoomUsernameExtractor>()
        .getChatOppositeUsername(room, this.myUser);
  }

  void sendMessage(String message) {
    sl<ChatRoomRepository>().sendMessage(
      this.room.roomID,
      ChatMessageModel(
        sendBy: this.myUser.username,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        messageType: "TEXT",
        message: message,
      ),
    );
  }

  Stream<List<ChatMessageModel>> getChat() {
    return sl<ChatRoomRepository>().getChats(this.room.roomID);
  }
}
