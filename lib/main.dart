import 'package:doc_booking_app/presentations/home/binding/home_binding.dart';
import 'package:doc_booking_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  // await Firebase.initializeApp();
  await GetStorage.init();
  // HttpService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor Booking App',
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      getPages: AppRoutes.pages,
      // initialBinding: AuthBinding(),
      themeMode: ThemeMode.system,
    );
  }
}
