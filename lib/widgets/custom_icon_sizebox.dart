import 'package:flutter/cupertino.dart';

Widget customIconSizeBox({required String iconPath, double heightWidth = 30}) {
  return SizedBox(
    width: heightWidth,
    height: heightWidth,
    child: Image.asset(
      iconPath,
      fit: BoxFit.contain,
    ),
  );
}
