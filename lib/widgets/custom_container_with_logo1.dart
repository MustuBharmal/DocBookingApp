import 'package:flutter/material.dart';
import 'custom_icon_sizebox.dart';

import 'custom_icon_sized_box.dart';

class ContainerWithIcon1 extends StatelessWidget {
  const ContainerWithIcon1(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.containerHeight,
      required this.containerWidth,
      required this.iconWidth,
      required this.iconHeight,
      required this.onPressed});

  final String text;
  final String iconPath;
  final double containerWidth;
  final double containerHeight;
  final double iconWidth;
  final double iconHeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: containerWidth,
        height: containerHeight,
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
                iconPath: iconPath,
                iconWidth: iconWidth,
                iconHeight: iconHeight),
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
