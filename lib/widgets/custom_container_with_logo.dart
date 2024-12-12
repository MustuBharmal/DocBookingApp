import 'package:flutter/material.dart';

import '../util/app_color.dart';
import '../util/styles.dart';

Widget containerWithLogo1({required String imagePath, required String text,void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
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
          Image.asset(imagePath,scale:2),
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
    ),
  );
}

Widget customContainerWithLogo2({String? text, String? iconPath}) {
  return Container(
    width: 343,
    height: 56,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF5F1FE)),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Row(
      children: [
        iconPath == null ? const SizedBox.shrink() : Image.asset(iconPath),
        const SizedBox(width: 10),
        Text(
          text!,style: txtInterMedium13,

        ),
      ],
    ),
  );
}
