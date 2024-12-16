import 'package:doc_booking_app/widgets/custom_icon_sizebox.dart';
import 'package:flutter/material.dart';

import '../../../global/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.iconPath,
      required this.height,
      required this.width,
      required this.label});

  final VoidCallback onPressed;
  final String label;
  final String iconPath;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.blueGradient1, AppColors.blueGradient2]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: CustomIconSizeBox(
                    iconPath: iconPath, iconWidth: 13.86, iconHeight: 12),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Color(0xFF2268FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
