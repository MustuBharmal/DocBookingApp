import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  RxInt selectedIndex = RxInt(0);
  final List<Widget> pages = const [
    HomeScreen(),
    ServiceScreen(),
    ServiceScreen(),
    ProfileScreen()
  ];

  final List<String> appBarTitle = const [
    'Home',
    'Service',
    'Specialists',
    'My Profile',
  ];
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
