import 'package:flutter/cupertino.dart';

class CustomIconSizeBox extends StatelessWidget {
  const CustomIconSizeBox(
      {super.key, required this.iconPath, this.iconWidth, this.iconHeight});

  final String iconPath;
  final double? iconWidth;

  final double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: iconWidth,
      height: iconHeight,
      iconPath,
      fit: BoxFit.contain,
    );
  }
}

