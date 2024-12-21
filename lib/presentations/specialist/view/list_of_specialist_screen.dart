import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/images.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../widget/custom_button.dart';

class ListOfSpecialistScreen extends GetView<SpecialistController> {
  const ListOfSpecialistScreen({super.key});

  static const routeName = '/list-of-specialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Search', back: true),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => CustomSearchTextfield(
                        hintText: ConstantString.searchByName,
                        controller: SpecialistController
                            .instance.searchController.value,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomContainerWithText(
                            text: ConstantString.home,
                          ),
                          CustomContainerWithText(
                            text: ConstantString.clinic,
                          )
                        ],
                      ),
                    ),
                    Obx(() {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        primary: true,
                        itemBuilder: (context, index) {
                          final doctorList =
                              HomeController.instance.doctorList[index];
                          return CustomSpecialistContainer(
                            picPath: doctorList?.profilePic ?? '',
                            name: doctorList?.name ?? '',
                            specialist: doctorList?.specialization ?? '',
                            charges: doctorList?.fees ?? '',
                            // rating: specialist.rating,
                            // review: specialist.review,
                            onPressed: () {
                              Get.to(SpecialistDetailScreen(doctor: doctorList!,));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: HomeController.instance.doctorList.length,
                      );
                    }),
                  ],
                ),
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
            )
          ],
        ));
  }
}
