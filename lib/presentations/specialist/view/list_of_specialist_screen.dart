import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:doc_booking_app/widgets/custom_container_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../widgets/custom_specialist_container.dart';
import '../widget/custom_search_textfield.dart';

class ListOfSpecialistScreen extends GetView<SpecialistController> {
  const ListOfSpecialistScreen({super.key});

  static const routeName = '/listOfSpecialist-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search", back: true),
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => CustomSearchTextField(
                  hintText: "Search by name",
                  controller:
                      SpecialistController.instance.searchController.value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomerContainerWithText(
                    text: "Home",
                    width: Get.height * 0.210,
                    height: Get.height * 0.06,
                  ),
                  CustomerContainerWithText(
                    text: "Clinic",
                    width: Get.height * 0.210,
                    height: Get.height * 0.06,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SizedBox(
                  width: 340,
                  height: 400,
                  child: Obx(() {
                    return ListView.separated(
                      physics: const ScrollPhysics(),
                      primary: true,
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
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: controller.filteredSpecialists.length,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
