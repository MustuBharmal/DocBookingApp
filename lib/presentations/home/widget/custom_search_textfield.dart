import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_icon_sizebox.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
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
          Obx(
            () => SizedBox(
              width: deviceWidth * 0.15,
              child: Row(
                children: [
                  Expanded(
                    child: CustomIconSizeBox(
                      iconPath: HomeController.instance.selectedImagePath.value,
                      iconWidth: Get.width * 0.07,
                      iconHeight: Get.width * 0.07,
                    ),
                  ),
                  Expanded(
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 30,
            child: VerticalDivider(
              color: Colors.grey.shade400,
              thickness: 1,
              width: 1,
            ),
          ),
          Expanded(
            child: TextField(
              controller: HomeController.instance.searchController.value,
              style: TextStyle(fontSize: deviceWidth * 0.04),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: deviceWidth * 0.04,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

