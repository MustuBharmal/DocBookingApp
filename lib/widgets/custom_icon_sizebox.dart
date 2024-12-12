import 'package:flutter/cupertino.dart';

Widget customIconSizeBox({required String iconPath, double? heightWidth}) {
  return SizedBox(
    width: heightWidth ?? 30,
    height: heightWidth ?? 30,
    child: Image.asset(
      iconPath,
      fit: BoxFit.contain,
    ),
  );
}
