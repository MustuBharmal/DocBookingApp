import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final VoidCallback onTap;

  const FAQItem({
    super.key,
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Image.asset(AppImage.filledAdd),
          onTap: onTap,
        ),
      ),
    );
  }
}