import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';

import '../global/styles.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool showAsterisk;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final String hintText;
  final int maxLines;
  final TextInputType inputType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.showAsterisk,
    required this.controller,
    required this.hintStyle,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(text: label, style: txtInterTextField, children: [
              TextSpan(
                  text: showAsterisk ? ' *' : '',
                  style: TextStyle(color: Colors.red)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              controller: controller,
              keyboardType: inputType,
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
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
