import 'package:doc_booking_app/global/app_color.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onChanged});

  final String hintText;
  final TextEditingController controller;
  Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (String value) => onChanged!(value),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.gray600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: AppColors.grey, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
