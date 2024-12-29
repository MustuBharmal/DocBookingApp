import 'dart:io';

import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/models/dashboard.dart';
import 'package:doc_booking_app/presentations/home/models/notification_model.dart';
import 'package:doc_booking_app/presentations/home/repo/home_repo.dart';
import 'package:doc_booking_app/presentations/services/models/service.dart';
import 'package:doc_booking_app/presentations/specialist/models/specialist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../specialist/models/doctor_list.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxInt selectedIndex = RxInt(0);
  Rxn<Dashboard> dashboard = Rxn(Dashboard());
  RxList<Service?> services = RxList.empty();
  RxList<DoctorsList?> doctorList = RxList.empty();
  RxList<Specialist?> specialistsList = RxList.empty();
  RxList<NotificationModel?> notificationList = RxList.empty();
  RxString selectedService = ''.obs;
  final List<String> appBarTitle = const [
    'Home',
    'Services',
    'Specialists',
    'My Profile',
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      dashboardData();
      getServices();
      getSpecialist();
      getSpecialistType();
      getNotification();
    });
  }

  void navigateTo(int index) {
    Get.back();
    selectedIndex.value = index;
  }

  Rx<String> selectedImagePath = ''.obs;

  // final Map<String, String> serviceImages = {
  //   'Phlebotomy': AppImage.homeCategory1,
  //   'Vitamin IV': AppImage.homeCategory2,
  //   'Vitamin Booster': AppImage.homeCategory3,
  //   'TRT Administration': AppImage.homeCategory4,
  //   'Bloodletting': AppImage.homeCategory5,
  //   'Flu Shots': AppImage.homeCategory6,
  // };

  void updateSelectedImage(Service service) {
    selectedImagePath.value = service.icon!;
  }

  void dashboardData() async {
    try {
      dashboard.value = await HomeRepo.dashboardApi();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void getServices() async {
    try {
      services.value = await HomeRepo.getServices();
      selectedImagePath.value = services[0]!.icon ?? AppImage.stethoscope;
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void getSpecialist() async {
    try {
      doctorList.value = await HomeRepo.getDoctors();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void getSpecialistType() async {
    try {
      specialistsList.value = await HomeRepo.getSpecialistType();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void getNotification() async {
    try {
      notificationList.value = await HomeRepo.getNotification();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }
}
