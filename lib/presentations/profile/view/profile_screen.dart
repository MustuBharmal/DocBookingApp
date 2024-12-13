import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
import 'package:get/get.dart';
import '../../../global/app_color.dart';
>>>>>>> 897a6bb (assets of profile screen added, made custom widgets, and did user info screen)
import '../../../widgets/custom_container_with_logo2.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile-screen';
  static const List detailList = [
    "User Info",
    "Payment Management",
    "FAQ",
    "Contact Us",
    "About Us",
    "How to be Partner",
    "Prescription"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
<<<<<<< HEAD
              itemBuilder: (context, index) =>
                  CustomContainerWithIcon2(text: detailList[index]),
=======
              itemBuilder: (context, index) => CustomContainerWithIcon2(
                    text: ConstantValue.detailList[index],
                    iconPath: ConstantValue.imagePathDetailList[index],
                    onPressed: () {
                      Get.toNamed(ConstantValue.navigateDetailList[index]);
                    },
                  ),
>>>>>>> 897a6bb (assets of profile screen added, made custom widgets, and did user info screen)
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: detailList.length),
        ));
  }
}
