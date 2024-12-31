import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/map_screen/map_screen.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/clinic_tab_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/home_tab_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/images.dart';
import '../../../widgets/custom_tab_bar.dart';
import '../widget/custom_button.dart';

class ListOfSpecialistScreen extends GetView<SpecialistController> {
  final List<DoctorsList?> doctorList;
  final int? specializationId;

  const ListOfSpecialistScreen({required this.doctorList, this.specializationId, super.key});

  static const routeName = '/list-of-specialist-screen';

  @override
  Widget build(BuildContext context) {
    controller.doctorList.clear();
    controller.doctorList.addAll(doctorList);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        controller.isMapView(false);
      },
      child: DefaultTabController(
        length: 2,
        child: Obx(
            ()=> Scaffold(
            bottomNavigationBar: controller.isMapView.value && controller.selectedDoctor.value != null
                ? Text(controller.selectedDoctor.value?.name ?? '')
                : null,
            appBar: const CustomAppBar(title: 'Search', back: true),
            body: Obx(
              () => Container(
                padding: controller.isMapView.value ? EdgeInsets.only(top: 16) : const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (!controller.isMapView.value) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomSearchTextfield(
                          hintText: ConstantString.searchByName,
                          controller: SpecialistController.instance.searchController.value,
                        ),
                      ),
                      const CustomTabBar(
                        tabText1: 'Home',
                        tabText2: 'Clinic',
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            HomeTabWidget(doctorList: controller.doctorList),
                            ClinicTabWidget(doctorList: controller.doctorList),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 23, right: 16),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                            onPressed: () => controller.goToMapScreen(specializationId ?? 0),
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
                            MapScreen(controller.userLocation!.latitude!, controller.userLocation!.longitude!),
                            Align(
                              alignment: Alignment.topCenter,
                              child: const CustomTabBar(
                                tabText1: 'Home',
                                tabText2: 'Clinic',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 113, right: 16),
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
