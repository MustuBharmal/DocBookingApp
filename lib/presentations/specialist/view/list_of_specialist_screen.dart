import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:doc_booking_app/widgets/custom_specialist_container.dart';

import '../widget/custom_button.dart';

class ListOfSpecialistScreen extends GetView<SpecialistController> {
  const ListOfSpecialistScreen({super.key});

  static const routeName = '/listOfSpecialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search", back: true),
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Main Content
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Search Field
                Obx(
                  () => CustomSearchTextfield(
                    hintText: ConstantString.searchByName,
                    controller:
                        SpecialistController.instance.searchController.value,
                  ),
                ),
                const SizedBox(height: 10),
                // Home & Clinics Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomerContainerWithText(
                      text: ConstantString.home,
                      width: Get.height * 0.210,
                      height: Get.height * 0.06,
                    ),
                    CustomerContainerWithText(
                      text: ConstantString.clinic,
                      width: Get.height * 0.210,
                      height: Get.height * 0.06,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Specialist List
                Expanded(
                  child: Obx(() {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final specialist =
                            controller.filteredSpecialists[index];
                        return CustomSpecialistContainer(
                          name: specialist.name,
                          specialist: specialist.specialist,
                          charges: specialist.charges,
                          rating: specialist.rating,
                          review: specialist.review,
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
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 23,
              right: 16,
              child: CustomButton(
                  onPressed: () {},
                  height: Get.height * 0.05,
                  width: Get.width * 0.33,
                  iconPath: AppImage.map,
                  label: "Map View")),
        ],
      ),
    );
  }
}
