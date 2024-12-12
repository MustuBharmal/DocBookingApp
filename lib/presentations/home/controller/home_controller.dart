import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/images.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = RxInt(0);

  final List<Widget> pages = const [
    HomeScreen(),
    ServiceScreen(),
    SpecialistScreen(),
    ProfileScreen()
  ];
  RxString selectedService = ''.obs;
  final List<String> appBarTitle = const [
    'Home',
    'Services',
    'Specialists',
    'My Profile',
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
  RxString selectedImagePath = Images.stethoscope.obs;

  final Map<String, String> serviceImages = {
    "Phlebotomy": Images.phlebotomy,
    "Vitamin IV": Images.vitaminIv,
    "Vitamin Booster": Images.vitaminBooster,
    "TRT Administration": Images.bloodletting,
    "Bloodletting": Images.trtAdministration,
    "Flu Shots": Images.flushots,
  };

  void updateSelectedImage(String service) {
    selectedImagePath.value = serviceImages[service] ?? "assets/logos/Stethoscope.png";
  }
}