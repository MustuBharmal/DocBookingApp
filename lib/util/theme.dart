import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_color.dart';

class AppThemes extends GetxService {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: AppColors.white,
      onSurface: AppColors.black,
      primary: AppColors.black,
      primaryContainer: AppColors.white,
      secondary: AppColors.black,
      // Accent color for buttons and other components
      // surface: Colors.white,
      // onBackground: Colors.black,
      // onPrimary: Colors.white,
      onSecondary: const Color(0xff393939).withOpacity(0.14),
      // onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 3,
      shadowColor: AppColors.grey,
      color: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.grey,
    ),
    iconTheme: IconThemeData(color: AppColors.black),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange.shade600, // Button background color
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),)
    ),
  );

  static AppThemes get to => Get.find();

}
