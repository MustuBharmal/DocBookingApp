import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_container_with_text.dart';

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        children: [
          CustomerContainerWithText(
            text: "Visit Local Clinic",
            width: Get.height * 1,
            height: Get.height * 0.06,
          ),
          const SizedBox(height: 10),
          CustomerContainerWithText(
            text: "Arrange Home Visit",
            width: Get.height * 1,
            height: Get.height * 0.06,
          ),
          const SizedBox(height: 10),
          CustomerContainerWithText(
            text: "Chat with Specialist",
            width: Get.height * 1,
            height: Get.height * 0.06,
          ),
        ],
      ),
    );
  }
}
