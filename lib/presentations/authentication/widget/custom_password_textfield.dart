import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';

class CustomPasswordTextfield extends GetView<AuthenticationController> {
  final String label;
  final bool showAsterisk;
  final TextEditingController textEditingController;
  final TextStyle hintStyle;
  final String hintText;
  final int maxLines;
  final bool isPasswordTextField;

  const CustomPasswordTextfield({
    super.key,
    required this.label,
    this.isPasswordTextField = false,
    required this.showAsterisk,
    required this.textEditingController,
    required this.hintStyle,
    required this.hintText,
    this.maxLines = 1,
  });

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
          // TextFormField with Obx for password visibility
          Obx(
            () => TextFormField(
              controller: textEditingController,
              style: txtInterDropDownValue,
              obscureText:
                  isPasswordTextField ? controller.isObscure.value : false,
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
                  borderSide: const BorderSide(color: Colors.red),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        icon: Icon(
                          controller.isObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          controller.isVisible();
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
