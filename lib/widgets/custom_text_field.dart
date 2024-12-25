import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../global/styles.dart';
import '../presentations/authentication/controller/authentication_controller.dart';

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
  final RxBool isPassword;
  final VoidCallback? onTap;
  Function? onChanged;

  CustomTextField({
    super.key,
    required this.label,
    required this.showAsterisk,
    required this.controller,
    required this.hintStyle,
    required this.hintText,
    required this.isPassword,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.errorText,
    this.readOnly = false,
    this.showDropDownIcon = false,
    this.onTap,
    this.onChanged,
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
                TextSpan(
                    text: showAsterisk ? ' *' : '',
                    style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Obx(
              () => TextFormField(
                onTap: onTap,
                onChanged: (value) => onChanged!(value),
                controller: controller,
                keyboardType: inputType,
                readOnly: readOnly,
                style: txtInterDropDownValue,
                maxLines: maxLines,
                obscureText: isPassword.value
                    ? AuthController.instance.isObscure.value
                    : false,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: hintStyle,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: AppColors.activeBorderColor,
                    ),
                  ),
                  suffixIconConstraints: showDropDownIcon
                      ? BoxConstraints(maxHeight: 24, maxWidth: 30)
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                  suffixIcon: isPassword.value
                      ? IconButton(
                          icon: Icon(
                            AuthController.instance.isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            AuthController.instance.isObscure.toggle();
                          },
                        )
                      : showDropDownIcon
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: SvgPicture.asset(
                                AppImage.arrowDown,
                                height: 10,
                                width: 10,
                              ),
                            )
                          : null,
                ),
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
