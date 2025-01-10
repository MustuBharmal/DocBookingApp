import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/theme.dart';
import 'package:doc_booking_app/presentations/authentication/binding/auth_binding.dart';
import 'package:doc_booking_app/routes/app_routes.dart';
import 'package:doc_booking_app/service/http_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  HttpService.initialize();
  await Firebase.initializeApp();
  requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstantString.appName,
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.pages,
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
    );
  }
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}
