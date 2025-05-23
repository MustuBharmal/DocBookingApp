import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPrescriptionContainer extends StatelessWidget {
  const CustomPrescriptionContainer(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.specialist,
      required this.onPressed,
      this.date,
      this.time});

  final String imageUrl;
  final String name;
  final String specialist;
  final String? date;
  final String? time;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: AppColors.borderColor)),
        leading: Container(
          width: 60,
          height: 60,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF4F4F6)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        isThreeLine: true,
        title: Text(
          name, //"Peater Parker",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              specialist, //"Psychiatrist",
              style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (date != null)
                  Row(
                    children: [
                      SvgPicture.asset(AppImage.calendar),
                      Text(
                        ' $date', // October 10, 2024
                        style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                if (time != null)
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.alarm,
                      ),
                      Text(
                        ' $time', // 10:30pm
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
