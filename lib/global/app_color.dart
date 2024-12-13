import 'package:flutter/material.dart';

abstract class AppColors {
  static Color primary = fromHex('#2268FF');
  static Color secondary = const Color(0xff262628);
  static Color black = const Color(0xff262628);
  static Color white = const Color(0xffFFFFFF);
  static Color textFieldBackground = const Color(0xffE5E5E5);
  static Color genderTextColor = const Color(0xffA6A6A6);
  static Color border = const Color(0xffC4C4C4);
  static Color white2 = const Color(0xffEEEEEE);
  static Color circle = const Color(0xffE2E2E2);
  static Color whiteGrey = const Color(0xffC3C2C2);
  static Color grey = const Color(0xff918F8F);
  static const Color shadow = Color(0xffedeef5);
  static const Color borderColor = Color(0xffF5F1FE);
  static const Color blue = Color(0xFF3C6EE0);
  static const Color darkBlue = Color(0xFF2554C2);
  static Color gray600 = fromHex('#717171');
  static Color gray = const Color.fromRGBO(137, 156, 168, 1);
  static Color whiteA700 = fromHex('#ffffff');
  static const Color blueGradient1 = Color(0xFFABE2FC);
  static const Color blueGradient2 = Color(0xFF2267FF);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
