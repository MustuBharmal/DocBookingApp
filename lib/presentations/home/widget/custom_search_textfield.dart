import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_dialogbox.dart';
import '../../../widgets/custom_icon_sized_box.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.95,
      height: Get.height * 0.07,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Obx(() => SizedBox(
                width: Get.width * 0.125,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomIconSizeBox(
                          iconPath:
                              HomeController.instance.selectedImagePath.value),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          TypeOfDialogs.showBottomSheetDialog(
                            Get.context!,
                            "Select Service",
                            HomeController.instance.serviceImages.keys.toList(),
                            HomeController.instance.searchController,
                          );
                        },
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(width: 8),
          VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 1,
            width: 1,
          ),
          const SizedBox(width: 8),
          Obx(
            () => Expanded(
              child: TextField(
                controller: HomeController.instance.searchController,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
