import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../global/styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool showAsterisk;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final String hintText;
  final int maxLines;
  final TextInputType inputType;
  final String? errorText;
  final bool readOnly;
  final bool showDropDownIcon;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.label,
    required this.showAsterisk,
    required this.controller,
    required this.hintStyle,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.errorText,
    this.readOnly = false,
    this.showDropDownIcon = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: label,
              style: txtInterTextField,
              children: [
                TextSpan(text: showAsterisk ? ' *' : '', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              onTap: onTap,
              controller: controller,
              keyboardType: inputType,
              readOnly: readOnly,
              style: txtInterDropDownValue,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.activeBorderColor,
                  ),
                ),
                suffixIconConstraints: showDropDownIcon ? BoxConstraints(maxHeight: 24, maxWidth: 30) : null,
                suffixIcon: showDropDownIcon
                    ? Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: SvgPicture.asset(
                          AppImage.arrowDown,
                          height: 10,
                          width: 10,
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
              ),
            ),
          ),
          if (errorText != null)
            Text(
              errorText!,
              style: TextStyle(color: AppColors.errorTextColor),
            )
        ],
      ),
    );
  }
}
