import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
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

  void navigateTo(int index) {
    Get.back();
    selectedIndex.value = index; // Update the index
    // Close the drawer
  }

  RxString selectedImagePath = AppImage.stethoscope.obs;

  final Map<String, String> serviceImages = {
    "Phlebotomy": AppImage.phlebotomy,
    "Vitamin IV": AppImage.vitaminIv,
    "Vitamin Booster": AppImage.vitaminBooster,
    "TRT Administration": AppImage.bloodletting,
    "Bloodletting": AppImage.trtAdministration,
    "Flu Shots": AppImage.flushots,
  };

  void updateSelectedImage(String service) {
    selectedImagePath.value =
        serviceImages[service] ?? AppImage.stethoscope;
  }
}