import 'package:electric_station_chat_demo/core/services-locator/main.dart';
import 'package:electric_station_chat_demo/core/util/chat-room-id-generator.dart';
import 'package:electric_station_chat_demo/core/vendors/firebase.dart';
import 'package:electric_station_chat_demo/core/vendors/location.dart';
import 'package:electric_station_chat_demo/features/authentication/presentations/welcome.dart';
import 'package:electric_station_chat_demo/features/chat/presentations/chat-room/screen.dart';
import 'package:electric_station_chat_demo/mock-data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServicesLocator();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    sl<LocationVendor>().requestPermission();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
