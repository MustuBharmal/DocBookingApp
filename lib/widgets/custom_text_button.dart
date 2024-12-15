import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? textColor;
  final TextStyle? textStyle;

  const CustomTextButton({required this.onPressed, required this.label, this.textColor, this.textStyle, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle?.copyWith(color: textColor ?? AppColors.primary) ??
            TextStyle(fontSize: 18, fontWeight: FontWeight.w500).copyWith(color: textColor ?? AppColors.primary),
      ),
    );
  }
}
