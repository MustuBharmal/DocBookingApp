
import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<Color>? gradients;
  final String label;

  const BlueButton({required this.label, this.onPressed, this.gradients, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradients ??
                [
                  AppColors.blueGradient1,
                  AppColors.blueGradient2,
                ],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
