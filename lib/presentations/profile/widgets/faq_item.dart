import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    RxBool expanded = RxBool(false);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Obx(
          ()=> GestureDetector(
          onTap:(){
            expanded.toggle();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      question,
                      overflow: TextOverflow.visible,
                      style: txtInterDropDownValue,
                    ),
                  ),
                  SvgPicture.asset(
                    expanded.value ? AppImage.filledMinus : AppImage.filledAdd,
                    width: 24,
                    height: 24,
                    colorFilter: expanded.value
                        ? ColorFilter.mode(AppColors.grey, BlendMode.srcIn)
                        : null,
                  ),
                ],
              ),
              if (expanded.value)
                Divider(
                  color: AppColors.borderColorLight,
                  thickness: 1,
                ),
              if (expanded.value) Text(answer, style: txtInterTextFieldHint),
            ],
          ),
        ),
      ),
    );
  }
}
