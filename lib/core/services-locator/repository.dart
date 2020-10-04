part of "main.dart";

void registerRepository() {
  sl.registerLazySingleton<ChatRoomRepository>(
    () => ChatRoomRepositoryImpl(
      datasource: sl(),
    ),
  );
}
