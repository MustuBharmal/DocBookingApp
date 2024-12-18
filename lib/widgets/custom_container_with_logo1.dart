import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerWithIcon1 extends StatelessWidget {
  const ContainerWithIcon1(
      {super.key,
      required this.text,
      required this.iconPath,
      required this.onPressed});

  final String text;
  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF363636),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
