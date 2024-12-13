import 'package:doc_booking_app/global/constant_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../widgets/custom_container_with_logo2.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
              itemBuilder: (context, index) => CustomContainerWithIcon2(
                    text: ConstantValue.detailList[index],
                    iconPath: ConstantValue.imagePathDetailList[index],
                    onPressed: () {
                      Get.toNamed(ConstantValue.navigateDetailList[index]);
                    },
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: ConstantValue.detailList.length),
        ));
  }
}
