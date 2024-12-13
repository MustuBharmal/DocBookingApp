import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({super.key,
    required this.label,
    required this.items,
    this.selectedItem,
    required this.onChanged,
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
