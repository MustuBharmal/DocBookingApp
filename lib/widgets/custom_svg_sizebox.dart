import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgSizeBox extends StatelessWidget {
  const CustomSvgSizeBox(
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
