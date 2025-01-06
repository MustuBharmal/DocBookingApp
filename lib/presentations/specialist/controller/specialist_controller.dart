import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../exception/server_exception.dart';
import '../../services/repo/services_repo.dart';
import '../models/doctor_list.dart';
import '../repository/specialist_repo.dart';

class SpecialistController extends GetxController {
  static SpecialistController get instance => Get.find<SpecialistController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList filteredSpecialists = [].obs;
  RxBool isMapView = RxBool(false);
  LocationData? userLocation;
  RxList<DoctorsList?> doctorList = RxList.empty();
  RxList<DoctorsList?> searchDoctorList = RxList.empty();
  Rx<Set<Marker>> markers = Rx({});

  Rx<DoctorsList?> selectedDoctor = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    Map<String, dynamic> data = {
      'specialization': Get.arguments['specializationId'],
    };
    print(Get.arguments['specializationId']);
    doctorList.clear();
    doctorList.addAll(await ServicesRepo.getSpecifiedDoctors(data));
    LogUtil.debug(doctorList.length);
    searchDoctorList.clear();
    searchDoctorList.addAll(doctorList);
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

  Future<void> goToMapScreen(int id) async {
    if (isMapView.value) {
      isMapView.toggle();
      return;
    }
    LoaderController.instance.showLoader();

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
      getNearByDoc(id, userLocation?.latitude ?? double.tryParse(AuthController.instance.user.value?.latitude ?? '0') ?? 0,
          userLocation?.longitude ?? double.tryParse(AuthController.instance.user.value?.longitude ?? '0') ?? 0);
    }
    LoaderController.instance.dismissLoader();
    isMapView.toggle();
  }

  void getNearByDoc(int specializationId, double lat, double long) async {
    try {
      doctorList.clear();
      doctorList.addAll(await SpecialistRepo.getDoctorsBySpecialization(specializationId, lat, long));
      Set<Marker> newMarkers = {};
      for (var d in doctorList) {
        double? lat = double.tryParse(d?.latitude ?? '0');
        double? lng = double.tryParse(d?.longitude ?? '0');
        if (lat != null && lng != null) {
          newMarkers.add(Marker(
              markerId: MarkerId(d?.id?.toString() ?? '0'),
              position: LatLng(lat, lng),
              onTap: () {
                LogUtil.debug(d?.name);
                selectedDoctor.value = d;
              }));
        }
      }
      markers.value = newMarkers;
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  Future<List<DoctorTimeTable>> getDoctorTimeTable({int? doctorId, int? clinicId}) async {
    try {
      final result = await SpecialistRepo.getDoctorTimeTable(doctorId: doctorId, clinicId: clinicId);
      return result;
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    }
    return [];
  }

  void searchList(String query) {
    query.toLowerCase();
    print(query);
    if (query == '') {
      searchDoctorList.clear();
      searchDoctorList.addAll(doctorList);
    } else {
      searchDoctorList.clear();
      searchDoctorList.addAll(doctorList.where((item) => item!.name!.toLowerCase().startsWith(query.toLowerCase())).toList());
      LogUtil.debug(searchDoctorList.length);
      searchDoctorList.refresh();
    }
  }
}
