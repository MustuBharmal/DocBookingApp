import 'package:flutter/material.dart';

import '../../../global/styles.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileField({
    super.key,
    required this.label,
    required this.value,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Spacing between rows
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            '$label: ',
            style: txtInterRegular15Gray600,
          ),

          // Value
          Expanded(
            child: Text(
              value,
              style: txtInterMedium13,
            ),
          ),
        ],
      ),
    );
  }
}
