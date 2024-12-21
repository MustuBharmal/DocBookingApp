import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../global/app_color.dart';
import '../global/images.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: iconPath,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, val, pr) {
                return Center(
                  child: CircularProgressIndicator(
                    value: pr.progress,
                  ),
                );
              },
              errorWidget: (context, val, obj) {
                return Image.asset(AppImage.serviceIcon1);
              },
            ),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                color: AppColors.textHeaderBlack,
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
