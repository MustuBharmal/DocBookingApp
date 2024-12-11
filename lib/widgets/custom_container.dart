import 'package:doc_booking_app/util/app_color.dart';
import 'package:flutter/cupertino.dart';

Widget customContainerWithLogo({String? text, String? iconPath}) {
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
          text!,
          style: const TextStyle(
            color: Color(0xFF191825),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
