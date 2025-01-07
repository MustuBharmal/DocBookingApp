import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../global/images.dart';

class CustomSpecialistContainer extends StatelessWidget {
  const CustomSpecialistContainer(
      {super.key,
      required this.name,
      required this.picPath,
      required this.specialist,
      required this.charges,
      required this.onPressed});

  final String name;
  final String picPath;

  // final int review;
  final String specialist;
  final String charges;

  // final double rating;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: Get.width * 0.18,
                    height: Get.height * 0.1,
                    imageUrl: picPath,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder: (context, val, pr) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: pr.progress,
                        ),
                      );
                    },
                    errorWidget: (context, val, obj) {
                      return SvgPicture.asset(
                        AppImage.specialistIcon1,
                      );
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.capitalizeFirst ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textHeaderBlack,
                          ),
                        ),
                        Text(
                          specialist,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textHeaderGray,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$$charges/hr',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
