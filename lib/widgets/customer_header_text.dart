import 'package:flutter/material.dart';

class CustomerHeaderText extends StatelessWidget {
  const CustomerHeaderText({super.key, required this.text, this.button});

  final String text;
  final dynamic button;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        button ?? const SizedBox.shrink()
      ],
    );
  }
}
