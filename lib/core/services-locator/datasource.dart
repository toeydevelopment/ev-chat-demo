part of "main.dart";

void registerDatasource() {
  sl.registerLazySingleton<ChatRoomDatasource>(
    () => ChatRoomDatasource(
      sl(),
    ),
  );
}
