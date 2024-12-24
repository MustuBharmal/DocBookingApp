import 'package:doc_booking_app/global/constant_string.dart';
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

  const ListOfSpecialistScreen({required this.doctorList, super.key});

  static const routeName = '/list-of-specialist-screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Search', back: true),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Obx(
                  () => CustomSearchTextfield(
                    hintText: ConstantString.searchByName,
                    controller:
                        SpecialistController.instance.searchController.value,
                  ),
                ),
              ),
              const CustomTabBar(
                tabText1: 'Home',
                tabText2: 'Clinic',
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HomeTabWidget(doctorList: doctorList),
                    ClinicTabWidget(doctorList: doctorList),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 23, right: 16),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    onPressed: () {},
                    height: Get.height * 0.05,
                    width: Get.width * 0.33,
                    iconPath: AppImage.map,
                    label: ConstantString.mapView,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
