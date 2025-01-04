import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_dialogbox.dart';
import '../../../widgets/custom_icon_sizebox.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    return Container(
      width: deviceWidth * 0.95,
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
            () => InkWell(
              onTap: () {
                TypeOfDialogs.showBottomSheetDialog(
                  Get.context!,
                  'Select Service',
                  [],
                  HomeController.instance.searchController.value,
                );
              },
              child: SizedBox(
                width: deviceWidth * 0.15,
                child: Row(
                  children: [
                    (HomeController.instance.selectedImagePath.value == AppImage.stethoscope)
                        ? SvgPicture.asset(HomeController.instance.selectedImagePath.value)
                        : CachedNetworkImage(
                            width: Get.width * 0.067,
                            height: Get.width * 0.067,
                            fit: BoxFit.contain,
                            imageUrl: HomeController.instance.selectedImagePath.value,
                          ),
                    Expanded(
                        child: CustomIconSizeBox(
                            iconPath: AppImage.arrowDown, iconWidth: deviceWidth * 0.028, iconHeight: Get.height * 0.008)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 7),
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
