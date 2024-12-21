import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Inter',
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBGColor,
      appBarTheme: AppBarTheme(scrolledUnderElevation: 0, backgroundColor: AppColors.transparent));
}
