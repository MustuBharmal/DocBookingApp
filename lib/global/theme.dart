import 'package:flutter/material.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Inter',
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(scrolledUnderElevation: 0));
}
