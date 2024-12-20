import 'dart:async';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_welcome_screen.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/util/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if(StorageUtil.getToken() != null && StorageUtil.getUserId() != null){
        Get.offAllNamed(NavigationScreen.routeName);
      }
      else if(StorageUtil.getOnboardingScreenId() != null && StorageUtil.getOnboardingScreenId() == true){
        Get.offAllNamed(LoginWelcomeScreen.routeName);
      }
      else {
        Get.offNamed(OnboardingScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImage.appLogo),
              SizedBox(
                height: Get.height * 0.065,
              ),
              Text(
                ConstantString.doctorBooking,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
