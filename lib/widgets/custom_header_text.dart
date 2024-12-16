import 'package:flutter/material.dart';
import '../../../global/styles.dart';


class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text, this.button});

  final String text;
  final dynamic button;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: subHeaderStyle),
        button ?? const SizedBox.shrink()
      ],
    );
  }
}