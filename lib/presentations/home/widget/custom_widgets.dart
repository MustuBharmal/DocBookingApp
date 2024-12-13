import 'package:doc_booking_app/global/constant_values.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/widgets/custom_icon_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_dialogbox.dart';

Widget customSearchTextField(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: Get.width * 0.95,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Obx(() => SizedBox(
                width: ConstantValue.width * 0.125,
                child: Row(
                  children: [
                    Expanded(
                      child: customIconSizeBox(
                          iconPath: controller.selectedImagePath.value),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          TypeOfDialogs.showBottomSheetDialog(
                            Get.context!,
                            "Select Service",
                            controller.serviceImages.keys.toList(),
                            controller.searchController,
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
          Expanded(
            child: TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: 'Search by service or location',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myHeaderText(
    {required String text, double? fontSize, TextButton? button}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
          color: const Color(0xFF363636),
          fontSize: fontSize ?? 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      button ?? const SizedBox.shrink()
    ],
  );
}

Widget customContainer({required String text}) {
  return Container(
    width: Get.width * 1,
    height: Get.height * 0.06,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF0F0F0)),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2268FF),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    ),
  );
}

