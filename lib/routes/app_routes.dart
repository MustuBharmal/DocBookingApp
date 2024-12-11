import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:get/get.dart';

import '../presentations/splash_screens/view/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  ];
}
