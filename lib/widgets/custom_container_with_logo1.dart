import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_icon_sizebox.dart';

class ContainerWithIcon1 extends StatelessWidget {
  const ContainerWithIcon1(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.height,
      required this.width,
      required this.onPressed});

  final String text;
  final String iconPath;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: Get.width * 0.275,
        height: Get.height * 0.18,
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
          children: [
            CustomIconSizeBox(
                iconPath: iconPath, iconWidth: width, iconHeight: height),
            const SizedBox(height: 16),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF363636),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
