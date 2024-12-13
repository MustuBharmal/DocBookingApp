import 'package:flutter/cupertino.dart';

class CustomIconSizeBox extends StatelessWidget {
  const CustomIconSizeBox(
      {super.key, required this.iconPath, this.heightWidth});

  final String iconPath;
  final double? heightWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: heightWidth ?? 30,
      height: heightWidth ?? 30,
      child: Image.asset(
        iconPath,
        fit: BoxFit.contain,
      ),
    );
  }
}

