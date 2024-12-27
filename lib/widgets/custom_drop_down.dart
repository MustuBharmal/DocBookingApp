import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final bool showAsterisk;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  final String? errorText;

  const CustomDropdown({
    super.key,
    required this.label,
    this.showAsterisk = false,
    required this.items,
    this.selectedItem,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rich Text Label with Asterisk
          RichText(
            text: TextSpan(
              text: label,
              style: txtInterTextField, // Use your text style
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

          // Dropdown Field
          DropdownButtonFormField<String>(
            value: selectedItem,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: AppColors.activeBorderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.borderColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            ),
            icon: SvgPicture.asset(AppImage.arrowDown,width: 10,height: 10,),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: txtInterDropDownValue,
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
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
