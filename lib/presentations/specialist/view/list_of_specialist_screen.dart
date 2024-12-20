import 'package:doc_booking_app/global/constant_string.dart';
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

  static const routeName = '/listOfSpecialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Search", back: true),
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
                          final specialist =
                              controller.filteredSpecialists[index];
                          return CustomSpecialistContainer(
                            picPath: '',
                            name: specialist.name,
                            specialist: specialist.doctorList,
                            charges: specialist.charges,
                            // rating: specialist.rating,
                            // review: specialist.review,
                            onPressed: () {
                              Get.toNamed(SpecialistDetailScreen.routeName);
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: controller.filteredSpecialists.length,
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
