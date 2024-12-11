import 'package:doc_booking_app/util/app_color.dart';
import 'package:doc_booking_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = 'profile-screen';
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
              itemBuilder: (context, index) =>
                  customContainerWithLogo(text: detailList[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: detailList.length),
        ));
  }
}
