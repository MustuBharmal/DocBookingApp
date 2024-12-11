import 'package:flutter/material.dart';

Widget containerWithImage({required String imagePath, required String text}) {
  return Container(
    width: 108.67,
    height: 122,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF5F1FE)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        const SizedBox(height: 16),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF363636),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0.12,
          ),
        ),
      ],
    ),
  );
}