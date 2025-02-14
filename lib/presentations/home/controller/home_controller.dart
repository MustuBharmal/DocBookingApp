import 'dart:io';

import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/models/dashboard.dart';
import 'package:doc_booking_app/presentations/home/models/notification_model.dart';
import 'package:doc_booking_app/presentations/home/repo/home_repo.dart';
import 'package:doc_booking_app/presentations/services/models/service.dart';
import 'package:doc_booking_app/presentations/specialist/models/specialist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../exception/server_exception.dart';
import '../../authentication/controller/loader_controller.dart';
import '../../specialist/models/doctor_list.dart';
import '../view/navigation_screen.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxInt selectedIndex = RxInt(0);
  Rxn<Dashboard> dashboard = Rxn(Dashboard());
  RxList<Service?> services = RxList.empty();
  RxList<DoctorsList> doctorList = RxList.empty();
  RxList<Specialist?> specialistsList = RxList.empty();
  RxList<NotificationModel?> notificationList = RxList.empty();

  // Separated Notifications
  RxList<NotificationModel?> unreadNotifications = RxList.empty();
  RxList<NotificationModel?> readNotifications = RxList.empty();

  // Notification IDs
  RxList<int?> unreadNotificationIds = RxList.empty();
  RxList<int?> readNotificationIds = RxList.empty();

  Rxn<Service> selectedService = Rxn(Service());
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
    selectedImagePath.value = AppImage.stethoscope;
    Future.delayed(Duration(seconds: 2), () {
      dashboardData();
      getServices();
      getSpecialist();
      getSpecialistType();
      getNotification();
    });
  }

  void categorizeNotifications() {
    unreadNotifications.value =
        notificationList.where((n) => n?.isRead == '0').toList();
    readNotifications.value =
        notificationList.where((n) => n?.isRead == '1').toList();

    unreadNotificationIds.value =
        unreadNotifications.map((n) => n?.id).toList();
    readNotificationIds.value = readNotifications.map((n) => n?.id).toList();
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

  void markAsReadNotification() async {
    try {
      await HomeRepo.markAsReadNotificationApi(unreadNotificationIds);
      Get.until(
              (routes) => routes.settings.name == NavigationScreen.routeName);
      getNotification();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void cancelBooking(int bookingId) async {
    try {
      await HomeRepo.cancelBooking(bookingId);

      LoaderController.instance.showLoader();
      HomeController.instance.selectedIndex.value = 0;
      HomeController.instance.dashboardData();
      Get.until((routes) => routes.settings.name == NavigationScreen.routeName);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  // Separate notifications into Today and Older
  List<NotificationModel?> get todayNotifications {
    final now = DateTime.now();
    return notificationList.where((notification) {
      final createdAt = DateTime.parse(notification!.createdAt!);
      return createdAt.year == now.year &&
          createdAt.month == now.month &&
          createdAt.day == now.day;
    }).toList();
  }

  List<NotificationModel?> get olderNotifications {
    final now = DateTime.now();
    return notificationList.where((notification) {
      final createdAt = DateTime.parse(notification!.createdAt!);
      return createdAt.isBefore(DateTime(now.year, now.month, now.day));
    }).toList();
  }

  // Calculate relative time
  String timeAgo(String createdAt) {
    final createdTime = DateTime.parse(createdAt);
    final now = DateTime.now();
    final difference = now.difference(createdTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return DateFormat('dd MMM yyyy').format(createdTime);
    }
  }

  void getNotification() async {
    try {
      notificationList.value = await HomeRepo.getNotification();
      categorizeNotifications();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }
}
