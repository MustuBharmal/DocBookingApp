import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/map_screen/map_screen.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/clinic_tab_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/home_tab_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:doc_booking_app/widgets/custom_specialist_container.dart';
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
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        controller.isMapView(false);
      },
      child: DefaultTabController(
        length: 2,
        child: Obx(
          () => Scaffold(
            /*bottomNavigationBar: controller.isMapView.value && controller.selectedDoctor.value != null
                ? SizedBox(
                    height: 75,
                    child: CustomSpecialistContainer(
                      picPath: controller.selectedDoctor.value?.profilePic ?? '',
                      name: controller.selectedDoctor.value?.name ?? '',
                      specialist: controller.selectedDoctor.value?.serviceData?.name ?? '',
                      charges: controller.selectedDoctor.value?.fees ?? '',
                      onPressed: () {
                        Get.toNamed(SpecialistDetailScreen.routeName,
                            arguments: {'doctor': controller.selectedDoctor.value!, 'serviceType': 'Home'});
                      },
                    ),
                  )
                : null,*/
            appBar: const CustomAppBar(
              title: 'Search',
              back: true,
              isNotificationVisible: false,
            ),
            body: Obx(
              () => Container(
                padding: controller.isMapView.value ? EdgeInsets.only(top: 16) : const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (!controller.isMapView.value) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomSearchTextField(
                          hintText: ConstantString.searchByName,
                          controller: SpecialistController.instance.searchController.value,
                          onChanged: (value) {
                            controller.searchList(value);
                          },
                        ),
                      ),
                      CustomTabBar(
                        tabText1: 'Home',
                        tabText2: 'Clinic',
                        onTap: (index) {},
                      ),
                      Obx(
                        () => Expanded(
                          child: TabBarView(
                            children: [
                              HomeTabWidget(
                                  doctorList: controller.searchDoctorList
                                      .where((doctor) => doctor!.serviceType.contains('home'))
                                      .toList()),
                              ClinicTabWidget(
                                  doctorList: controller.searchDoctorList
                                      .where((doctor) => doctor!.serviceType.contains('clinic'))
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
                            MapScreen(
                                controller.userLocation!.latitude!, controller.userLocation!.longitude!, controller.markers),
                            Align(
                              alignment: Alignment.topCenter,
                              child: CustomTabBar(
                                tabText1: 'Home',
                                tabText2: 'Clinic',
                                onTap: (index) {
                                  controller.changeMapList(index);
                                },
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
                            if (controller.isMapView.value && controller.selectedDoctor.value != null)
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  height: 75,
                                  width: Get.width * 0.90,
                                  child: CustomSpecialistContainer(
                                    picPath: controller.selectedDoctor.value?.profilePic ?? '',
                                    name: controller.selectedDoctor.value?.name ?? '',
                                    specialist: controller.selectedDoctor.value?.serviceData?.name ?? '',
                                    charges: controller.selectedDoctor.value?.fees ?? '',
                                    onPressed: () {
                                      Get.toNamed(SpecialistDetailScreen.routeName, arguments: {
                                        'doctor': controller.selectedDoctor.value!,
                                        'serviceType': controller.selectedTabIndex == 0 ? 'Home' : 'Clinic'
                                      });
                                    },
                                  ),
                                ),
                              )
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
