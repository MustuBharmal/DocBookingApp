import 'dart:async';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
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
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed(OnboardingScreen.routeName),
    );
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
                "Doctor's Booking",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 26,
                  fontFamily: 'Inter',
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
