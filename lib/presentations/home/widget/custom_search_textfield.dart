import 'package:doc_booking_app/global/app_color.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // search for home screen
                CustomIconSizeBox(
                    iconPath:
                        HomeController.instance.selectedImagePath.value),
                IconButton(
                  onPressed: () {
                    TypeOfDialogs.showBottomSheetDialog(
                      Get.context!,
                      "Select Service",
                      HomeController.instance.serviceImages.keys.toList(),
                      HomeController.instance.searchController.value,
                    );
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: AppColors.border,
                  thickness: 1,
                  width: 2,
                ),
              ),
              const SizedBox(width: 11,),
              Expanded(
                child: Obx(
                  () => TextField(
                    controller: HomeController.instance.searchController.value,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
