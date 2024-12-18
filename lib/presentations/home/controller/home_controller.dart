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

  void navigateTo(int index) {
    Get.back();
    selectedIndex.value = index;
  }

  RxString selectedImagePath = AppImage.stethoscope.obs;

  final Map<String, String> serviceImages = {
    "Phlebotomy": AppImage.homeCategory1,
    "Vitamin IV": AppImage.homeCategory2,
    "Vitamin Booster": AppImage.homeCategory3,
    "TRT Administration": AppImage.homeCategory4,
    "Bloodletting": AppImage.homeCategory5,
    "Flu Shots": AppImage.homeCategory6,
  };

  void updateSelectedImage(String service) {
    selectedImagePath.value = serviceImages[service] ?? AppImage.stethoscope;
  }
}
