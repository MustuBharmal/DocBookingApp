import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/map_screen/map_screen.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/clinic_tab_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/home_tab_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/images.dart';
import '../../../widgets/custom_tab_bar.dart';
import '../../home/view/notification_screen.dart';
import '../../specialist/widget/custom_button.dart';
import '../controller/service_controller.dart';

class ListOfServicesDoctorScreen extends GetView<ServicesController> {
  final List<DoctorsList?> doctorList;
  final int? serviceId;

  const ListOfServicesDoctorScreen(
      {required this.doctorList, this.serviceId, super.key});

  static const routeName = '/list-of-services-doctor-screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        controller.isMapView(false);
        controller.searchController.clear();
      },
      child: DefaultTabController(
        length: 2,
        child: Obx(
          () => Scaffold(
            bottomNavigationBar: controller.isMapView.value &&
                    controller.selectedDoctor.value != null
                ? Text(controller.selectedDoctor.value?.name ?? '')
                : null,
            appBar: CustomAppBar(
              title: 'Search',
              back: true,
              onPressed: () {
                Get.toNamed(NotificationScreen.routeName);
              },
            ),
            body: Obx(
              () => Container(
                padding: controller.isMapView.value
                    ? EdgeInsets.only(top: 16)
                    : const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (!controller.isMapView.value) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomSearchTextField(
                          hintText: ConstantString.searchByName,
                          controller: controller.searchController,
                          onChanged: (value) {
                            controller.searchList(value);
                          },
                        ),
                      ),
                      const CustomTabBar(
                        tabText1: 'Home',
                        tabText2: 'Clinic',
                      ),
                      Obx(
                        () => Expanded(
                          child: TabBarView(
                            children: [
                              HomeTabWidget(
                                  doctorList: controller.searchDoctorList.value
                                      .where((doctor) =>
                                      doctor!.serviceType!.contains('home'))
                                      .toList()),
                              ClinicTabWidget(
                                  doctorList:
                                  controller.searchDoctorList.value
                                      .where((doctor) =>
                                      doctor!.serviceType!.contains('clinic'))
                                      .toList()),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 23, right: 16),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                            onPressed: () =>
                                controller.goToMapScreen(serviceId ?? 0),
                            height: Get.height * 0.05,
                            width: Get.width * 0.33,
                            iconPath: AppImage.map,
                            label: ConstantString.mapView,
                          ),
                        ),
                      ),
                    ] else
                      Expanded(
                        child: Stack(
                          children: [
                            MapScreen(controller.userLocation!.latitude!,
                                controller.userLocation!.longitude!),
                            Align(
                              alignment: Alignment.topCenter,
                              child: const CustomTabBar(
                                tabText1: 'Home',
                                tabText2: 'Clinic',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 113, right: 16),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CustomButton(
                                  onPressed: controller.goToListScreen,
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.33,
                                  iconPath: AppImage.map,
                                  label: ConstantString.listView,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
