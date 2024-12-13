import 'package:flutter/material.dart';
import '../global/app_color.dart';
import '../global/styles.dart';

class CustomContainerWithIcon2 extends StatelessWidget {
  const CustomContainerWithIcon2(
      {super.key, required this.text, this.iconPath});

  final String text;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
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
          iconPath == null ? const SizedBox.shrink() : Image.asset(iconPath!),
          const SizedBox(width: 10),
          Text(
            text,
            style: txtInterMedium13,
          ),
        ],
      ),
    );
  }
}
