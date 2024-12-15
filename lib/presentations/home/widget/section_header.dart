
import 'package:flutter/material.dart';

import '../../../widgets/custom_header_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? button;
  final double spacing;
  final Widget child;

  const SectionHeader({
    super.key,
    required this.title,
    this.button,
    required this.spacing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomerHeaderText(text: title),
            if (button != null) button!,
          ],
        ),
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}
