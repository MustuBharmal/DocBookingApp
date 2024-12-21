import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialistController extends GetxController {
  static SpecialistController get instance => Get.find<SpecialistController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList filteredSpecialists = [].obs;

  @override
  void onInit() {
    super.onInit();
    searchController.value.addListener(() {
      // filterSpecialists();
    });
  }

  /*void filterSpecialists() {
    String query = searchController.value.text.toLowerCase();
    if (query.isEmpty) {
      filteredSpecialists.value = specialists;
    } else {
      filteredSpecialists.value = specialists
          .where((specialist) => specialist.name.toLowerCase().contains(query))
          .toList();
    }
  }*/
}
