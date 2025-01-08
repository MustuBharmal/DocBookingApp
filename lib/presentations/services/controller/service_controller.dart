import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../exception/server_exception.dart';
import '../../specialist/models/doctor_list.dart';
import '../repo/services_repo.dart';

class ServicesController extends GetxController {
  static ServicesController get instance => Get.find<ServicesController>();
  TextEditingController searchController = TextEditingController();
  RxList filteredSpecialists = [].obs;
  RxBool isMapView = RxBool(false);
  LocationData? userLocation;
  RxList<DoctorsList?> doctorList = RxList.empty();
  RxList<DoctorsList?> searchDoctorList = RxList.empty();
  Rx<Set<Marker>> markers = Rx({});
  Set<Marker> homeMarkers = {};
  Set<Marker> clinicMarkers = {};

  Rx<DoctorsList?> selectedDoctor = Rx(null);
  BitmapDescriptor? locationIcon;
  BitmapDescriptor? selectedLocationIcon;
  int selectedTabIndex = 0;

  changeMapList(int index) {
    if (index != selectedTabIndex) {
      selectedTabIndex = index;
      sortMarkers();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    Map<String, dynamic> data = {
      'services': Get.arguments['serviceId'],
    };
    doctorList.clear();
    doctorList.addAll(await ServicesRepo.getSpecifiedDoctors(data));
    LogUtil.debug(doctorList.length);
    searchDoctorList.clear();
    searchDoctorList.addAll(doctorList);
    BitmapDescriptor.asset(ImageConfiguration(size: Size(36, 36)), 'assets/icons/location.png').then((d) {
      locationIcon = d;
    });
    BitmapDescriptor.asset(ImageConfiguration(size: Size(36, 36)), 'assets/icons/location_selected.png').then((d) {
      selectedLocationIcon = d;
    });
  }

  @override
  void onClose() {
    super.onClose();
    isMapView.value = false;
    searchController.clear();
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

  void getNearByDoc(int serviceId, double lat, double long) async {
    try {
      doctorList.clear();
      doctorList.addAll(await ServicesRepo.getDoctorsByServices(serviceId, lat, long));

      sortMarkers();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  sortMarkers({DoctorsList? doctor}) {
    homeMarkers.clear();
    clinicMarkers.clear();
    for (var d in doctorList) {
      double? lat = double.tryParse(d?.latitude ?? '0');
      double? lng = double.tryParse(d?.longitude ?? '0');
      if (lat != null && lng != null) {
        if (d?.serviceType.contains('home') == true) {
          if (doctor != null && doctor.id == d?.id) {
            if (selectedLocationIcon != null) {
              homeMarkers.add(
                Marker(
                    markerId: MarkerId(d?.id?.toString() ?? '0'),
                    position: LatLng(lat, lng),
                    icon: selectedLocationIcon!,
                    onTap: () {
                      sortMarkers();
                    }),
              );
            } else {
              homeMarkers.add(
                Marker(
                    markerId: MarkerId(d?.id?.toString() ?? '0'),
                    position: LatLng(lat, lng),
                    onTap: () {
                      sortMarkers();
                    }),
              );
            }
          } else {
            if (locationIcon != null) {
              homeMarkers.add(
                Marker(
                  markerId: MarkerId(d?.id?.toString() ?? '0'),
                  position: LatLng(lat, lng),
                  icon: locationIcon!,
                  onTap: () {
                    sortMarkers(doctor: d);
                  },
                ),
              );
            } else {
              homeMarkers.add(
                Marker(
                  markerId: MarkerId(d?.id?.toString() ?? '0'),
                  position: LatLng(lat, lng),
                  onTap: () {
                    sortMarkers(doctor: d);
                  },
                ),
              );
            }
          }
        }
        if (d?.serviceType.contains('clinic') == true) {
          if (doctor != null && doctor.id == d?.id) {
            if (selectedLocationIcon != null) {
              clinicMarkers.add(
                Marker(
                    markerId: MarkerId(d?.id?.toString() ?? '0'),
                    position: LatLng(lat, lng),
                    icon: selectedLocationIcon!,
                    onTap: () {
                      sortMarkers();
                    }),
              );
            } else {
              clinicMarkers.add(
                Marker(
                    markerId: MarkerId(d?.id?.toString() ?? '0'),
                    position: LatLng(lat, lng),
                    onTap: () {
                      sortMarkers();
                    }),
              );
            }
          } else {
            if (locationIcon != null) {
              clinicMarkers.add(
                Marker(
                  markerId: MarkerId(d?.id?.toString() ?? '0'),
                  position: LatLng(lat, lng),
                  icon: locationIcon!,
                  onTap: () {
                    sortMarkers(doctor: d);
                  },
                ),
              );
            } else {
              clinicMarkers.add(Marker(
                  markerId: MarkerId(d?.id?.toString() ?? '0'),
                  position: LatLng(lat, lng),
                  onTap: () {
                    sortMarkers(doctor: d);
                  }));
            }
          }
        }
      }
    }
    selectedDoctor.value = doctor;
    markers.value = selectedTabIndex == 0 ? homeMarkers : clinicMarkers;
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
