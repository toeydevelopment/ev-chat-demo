part of "main.dart";

void registerUtil() {
  sl.registerLazySingleton<ChatRoomUsernameExtractor>(
      () => ChatRoomUsernameExtractor());
  sl.registerLazySingleton<ChatRoomIDGenerator>(() => ChatRoomIDGenerator());
}
