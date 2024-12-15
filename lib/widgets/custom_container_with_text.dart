import 'package:flutter/material.dart';

import '../global/app_color.dart';

class CustomerContainerWithText extends StatelessWidget {
  const CustomerContainerWithText(
      {super.key,
      required this.text,});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side:  BorderSide(width: 1, color: AppColors.borderColorLight),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.blueGradient2,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
