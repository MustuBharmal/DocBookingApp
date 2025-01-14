import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/presentations/home/models/dashboard.dart';
import 'package:doc_booking_app/util/custom_date_utils.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';
import '../global/images.dart';
import '../global/styles.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  final UpcomingAppointmentsData appointmentData;

  const UpcomingAppointmentCard({required this.appointmentData, super.key});

  @override
  Widget build(BuildContext context) {
    LogUtil.debug(appointmentData.doctorData?.profilePic ?? appointmentData.clinicData?.profilePic);
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
                  imagePath: appointmentData.doctorData?.profilePic ?? appointmentData.clinicData?.profilePic,
                  size: 60,
                  borderRadius: 12,
                ),
                const SizedBox(width: 12),
                TitleSubtitle(
                  title: appointmentData.doctorData?.name ?? appointmentData.clinicData?.name ?? '',
                  subtitle: appointmentData.doctorData?.serviceData?.name ?? appointmentData.clinicData?.serviceData?.name ?? '',
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
                  text: appointmentData.typeData?.toUpperCase() ?? '',
                ),
                BadgeWidget(
                  image: AppImage.alarm,
                  color: Colors.white,
                  text: appointmentData.doctorTimeTableData?.startTime ?? '',
                ),
              ],
            ),
            const SizedBox(height: 8),
            BadgeWidget(
              image: AppImage.calendar,
              color: AppColors.white,
              text: CustomDateUtils.getDayAndDate(DateTime.tryParse(appointmentData.bookingDateTime?.split('T').first ?? '')),
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
          SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class RoundedImage extends StatelessWidget {
  final String? imagePath;
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: size,
        width: size,
        child: CachedNetworkImage(
          imageUrl: imagePath ?? '',
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
      ),
    );
    /*return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );*/
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
        Text(subtitle, style: txtInterSubtitle13White),
      ],
    );
  }
}
