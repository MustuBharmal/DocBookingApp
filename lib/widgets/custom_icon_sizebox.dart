
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconSizeBox extends StatelessWidget {
  const CustomIconSizeBox(
      {super.key,
      required this.iconPath,
      required this.iconWidth,
      required this.iconHeight});

  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: iconWidth,
      height: iconHeight,
      iconPath,
      fit: BoxFit.contain,
    );
  }
}
