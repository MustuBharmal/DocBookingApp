import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/widgets/custom_icon_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:doc_booking_app/global/styles.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.day,
    required this.rating,
    required this.review,
  });

  final String imagePath;
  final String name;
  final String day;
  final double rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.borderColor)),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///user Image
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.borderColor)),
                    child: CustomIconSizeBox(
                      iconPath: imagePath,
                    )),
                const SizedBox(width: 12),
                ///Name and day
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: headerStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(day, style: subtitleStyle1),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              review,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
