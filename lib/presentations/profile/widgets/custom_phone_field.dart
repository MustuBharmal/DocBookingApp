import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String initialCountryCode;
  final ValueChanged<String>? onChanged;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.initialCountryCode = '+1', // Default to USA
    this.onChanged,

  });

  @override
  Widget build(BuildContext context) {
    String selectedCountryCode = initialCountryCode;

    return Container(
      width: 343,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
        ),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Country Code Selector
          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  selectedCountryCode = '+${country.phoneCode}';
                  if (onChanged != null) {
                    onChanged!(
                        "$selectedCountryCode ${controller.text}");
                  }
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    selectedCountryCode,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
            ),
          ),

          // Vertical Divider
          Container(
            width: 1,
            height: 30,
            color: Colors.grey.shade300,
          ),

          // Phone Number Input
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!("$selectedCountryCode $value");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
