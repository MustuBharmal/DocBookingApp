
import 'package:doc_booking_app/presentations/home/binding/home_binding.dart';
import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:get/get.dart';

import '../presentations/splash_screens/view/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(name: NavigationScreen.routeName, page: ()=>const NavigationScreen()),
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(),binding: HomeBinding()),
    GetPage(name: ServiceScreen.routeName, page: () => const ServiceScreen()),
  ];
}
