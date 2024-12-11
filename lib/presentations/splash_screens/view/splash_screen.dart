import 'dart:async';

import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Timer.periodic(const Duration(seconds: 3),
        (timer) => Get.offNamed(HomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
