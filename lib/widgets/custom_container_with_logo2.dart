import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global/app_color.dart';
import '../global/styles.dart';

class CustomContainerWithIcon2 extends StatelessWidget {
  const CustomContainerWithIcon2(
      {super.key, required this.text, this.iconPath, required this.onPressed,});

  final String text;
  final String? iconPath;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
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
            iconPath == null ? const SizedBox.shrink() : SvgPicture.asset(
              width:18,
              height: 20,
              iconPath!,colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),),
            const SizedBox(width: 10),
            Text(
              text,
              style: txtInterMedium13,
            ),
          ],
        ),
      ),
    );
  }
}
