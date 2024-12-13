import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWelcomeScreen extends StatelessWidget {
  static const String routeName = '/login-welcome-screen';

  const LoginWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Image.asset(AppImage.appLogo),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Text(
                    "Doctor's Booking",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            BlueButton(
              onPressed: () {
                Get.offNamed(NavigationScreen.routeName);
              },
              label: 'Sign In',
            ),
            const SizedBox(height: 12),
            CustomOutlinedButton(
              label: 'Sign Up',
              onPressed: () {
                Get.offNamed(NavigationScreen.routeName);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
