import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                question,
                style: txtInterDropDownValue
              ),
              trailing: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  isExpanded ? AppImage.filledMinus : AppImage.filledAdd,
                  colorFilter: isExpanded
                      ? ColorFilter.mode(AppColors.grey, BlendMode.srcIn)
                      : null,
                ),
              ),
              onTap: onTap,
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  answer,
                  style: txtInterTextFieldHint
                ),
              ),
          ],
        ),
      ),
    );
  }
}
