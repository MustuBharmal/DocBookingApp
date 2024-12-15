import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxInt selectedIndex = RxInt(0);

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
    selectedImagePath.value = serviceImages[service] ?? AppImage.stethoscope;
  }
}
