import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class CustomDobTextField extends StatelessWidget {
  const CustomDobTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.showAsterisk,
      required this.hintStyle,
      required this.hintText,
      required this.validator});

  final TextEditingController controller;
  final String label;
  final bool showAsterisk;
  final TextStyle hintStyle;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label with optional asterisk
          RichText(
            text: TextSpan(
              text: label,
              style: txtInterTextField,
              children: [
                if (showAsterisk)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            readOnly: true,
            validator: validator,
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              hintStyle: hintStyle,
              border: OutlineInputBorder(),
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
                borderSide: const BorderSide(color: Colors.red),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                controller.text =
                    DateFormat('dd/MM/yyyy').format(pickedDate).split(' ')[0];
              }
            },
          ),
        ],
      ),
    );
  }
}
