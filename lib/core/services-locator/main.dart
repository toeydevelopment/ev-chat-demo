import 'package:electric_station_chat_demo/core/util/chat-room-id-generator.dart';
import 'package:electric_station_chat_demo/core/util/chat-room-username-extractor.dart';
import 'package:electric_station_chat_demo/core/vendors/firebase.dart';
import 'package:electric_station_chat_demo/core/vendors/location.dart';
import 'package:electric_station_chat_demo/features/chat/data/datasource/chat-room.datasource.dart';
import 'package:electric_station_chat_demo/features/chat/data/repository/chat-room.repository.dart';
import 'package:electric_station_chat_demo/features/chat/domain/repository/chat-room.repository.dart';
import "package:get_it/get_it.dart";
import 'package:shared_preferences/shared_preferences.dart';

part "vendors.dart";
part "util.dart";
part "datasource.dart";
part "repository.dart";

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  final share = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(
    () => share,
  );

  registerUtil();
  await registerVendors();
  registerDatasource();
  registerRepository();

  return;
}
