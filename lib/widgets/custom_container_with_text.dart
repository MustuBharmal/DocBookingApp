import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerContainerWithText extends StatelessWidget {
  const CustomerContainerWithText(
      {super.key,
      required this.text,
      required this.height,
      required this.width});

  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,//Get.width * 1,
      height: height,//Get.height * 0.06,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF0F0F0)),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF2268FF),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
    );
  }
}
