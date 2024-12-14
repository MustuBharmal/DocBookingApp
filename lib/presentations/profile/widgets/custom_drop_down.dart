import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final bool showAsterisk;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    this.showAsterisk = false,
    required this.items,
    this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  color: AppColors.darkBlue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),

              contentPadding: const EdgeInsets.symmetric(horizontal: 16),

            ),
            icon: Image.asset(AppImage.arrowDown),
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
        ],
      ),
    );
  }
}
