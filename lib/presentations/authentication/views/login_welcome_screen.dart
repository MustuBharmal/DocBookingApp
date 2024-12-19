import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWelcomeScreen extends GetView<AuthenticationController> {
  static const String routeName = '/login-welcome-screen';

  const LoginWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ConstantString.welcomeTo,
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
                      ConstantString.doctorBooking,
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
                onPressed: () => Get.toNamed(LoginScreen.routeName),
                label: ConstantString.signIn,
              ),
              const SizedBox(height: 12),
              CustomOutlinedButton(
                label: ConstantString.signUn,
                onPressed: () => Get.toNamed(SignupScreen.routeName),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
