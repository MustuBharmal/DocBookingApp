import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class SpecialistController extends GetxController {
  static SpecialistController get instance => Get.find<SpecialistController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList filteredSpecialists = [].obs;
  RxBool isMapView = RxBool(false);
  LocationData? userLocation;

  @override
  void onInit() {
    super.onInit();
    searchController.value.addListener(() {
      // filterSpecialists();
    });
  }

  @override
  void onClose() {
    super.onClose();
    isMapView.value = false;
  }

  void goToListScreen() {
    if (isMapView.value) {
      isMapView.toggle();
      return;
    }
    Get.back();
  }

  Future<void> goToMapScreen() async {
    if (isMapView.value) {
      isMapView.toggle();
      return;
    }
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    LogUtil.debug(permissionGranted.toString());
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    userLocation = await location.getLocation();
    if (userLocation != null) {
      isMapView.toggle();
    }
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
