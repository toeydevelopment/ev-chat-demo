part of "main.dart";

Future<void> registerVendors() async {
  sl.registerLazySingleton<FirebaseVendor>(
    () => FirebaseVendor(),
  );

  sl.registerLazySingleton<LocationVendor>(() => LocationVendor());
}
