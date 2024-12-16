import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';

class CustomSpecialistContainer extends StatelessWidget {
  const CustomSpecialistContainer(
      {super.key,
      required this.name,
      required this.specialist,
      required this.review,
      required this.rating,
      required this.charges,
      required this.onPressed});

  final String name;
  final int review;
  final String specialist;
  final int charges;
  final double rating;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.borderColor)),
        leading: Container(
          width: 60,
          height: 60,
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: NetworkImage("https://via.placeholder.com/60x60"),
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
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              specialist, //"Psychiatrist",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
                const SizedBox(width: 5),
                Text(
                  "($review Reviews)",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        trailing: Text(
          "\$$charges/hr",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}
