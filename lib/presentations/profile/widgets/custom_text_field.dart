import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool showAsterisk;
  final TextEditingController controller;

  const CustomTextField({super.key,
    required this.label,
    required this.showAsterisk,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
        ),
        border: Border.all(width: 1),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixText: showAsterisk ? '*' : null,
          suffixStyle: TextStyle(color: Colors.red),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
