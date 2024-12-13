import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key,required this.hintText,required this.controller});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: SizedBox(
        width: Get.width * 0.95,
        height: 50,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }
}
