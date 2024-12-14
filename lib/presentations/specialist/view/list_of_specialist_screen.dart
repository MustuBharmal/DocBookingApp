import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/presentations/specialist/widget/custom_search_textfield.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../widgets/custom_specialist_container.dart';

class ListOfSpecialistScreen extends GetView<SpecialistController> {
  const ListOfSpecialistScreen({super.key});

  static const routeName = '/listOfSpecialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search", back: true),
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => CustomSearchTextfield(
                  hintText: ConstantString.searchByName,
                  controller:
                      SpecialistController.instance.searchController.value,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
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
              ),
              Obx(() {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: true,
                  itemBuilder: (context, index) {
                    final specialist = controller.filteredSpecialists[index];
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
            ],
          ),
        ),
      ),
    );
  }
}
