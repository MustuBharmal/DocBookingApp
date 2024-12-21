import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageContainer extends GetView<AuthController> {
  const CustomImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => DottedBorder(
          color: Color(0xFFF5F1FE),
          dashPattern: [8, 4],
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          child: Container(
            width: Get.width * 0.2,
            height: Get.height * 0.095,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: controller.selectedImage.value == null
                ? Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                    size: 36,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      controller.selectedImage.value!,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
          ),
        )).onClick(() {});
  }
}
