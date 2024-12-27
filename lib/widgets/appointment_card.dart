
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';
import '../global/images.dart';
import '../global/styles.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width * 0.890,
        height: Get.height * 0.250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blueGradient2, AppColors.blueGradient3],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RoundedImage(
                  imagePath: AppImage.femaleDoctor2,
                  size: 60,
                  borderRadius: 12,
                ),
                const SizedBox(width: 12),
                const TitleSubtitle(
                  title: 'Peater Parker',
                  subtitle: 'Psychiatrist',
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BadgeWidget(
                  image: AppImage.firstAid,
                  color: Colors.white,
                  text: 'Home Visit',
                ),
                BadgeWidget(
                  image: AppImage.alarm,
                  color: Colors.white,
                  text: '10:30pm',
                ),
              ],
            ),

            const SizedBox(height: 8),
            BadgeWidget(
              image: AppImage.calendar,
              color: AppColors.white,
              text: 'October 10, 2024',
            ),
          ],
        ),
      ),
    );
  }
}




class BadgeWidget extends StatelessWidget {
  final String image;
  final String text;
  final Color? color;

  const BadgeWidget({
    super.key,
    required this.image,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.blueGradient3,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(image,colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    );
  }
}



class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double size;
  final double borderRadius;

  const RoundedImage({
    super.key,
    required this.imagePath,
    required this.size,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



class TitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: txtInterTitle16White,
        ),
        Text(
            subtitle,
            style:txtInterSubtitle13White
        ),
      ],
    );
  }
}
