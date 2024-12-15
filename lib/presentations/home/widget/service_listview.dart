import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/constant_values.dart';
import '../../../widgets/custom_container_with_logo1.dart';

class ServiceListView extends StatelessWidget {
  const ServiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.18,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ContainerWithIcon1(
            onPressed: () {},
            iconPath: ConstantValue.imagePathListForServices[index],
            text: ConstantValue.textListForServices[index],
            containerHeight: Get.height * 0.18,
            containerWidth: Get.width * 0.275,
            iconHeight: Get.height * 0.055,
            iconWidth: Get.height * 0.055,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 3,
      ),
    );
  }
}
