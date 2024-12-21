import 'dart:async';

import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class CustomCountryStateDropdown<T> extends StatelessWidget {
  final String label;
  final bool showAsterisk;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T)? onSelected;
  final FutureOr<List<T>?> Function(String) suggestionsCallback;
  final TextEditingController controller;

  const CustomCountryStateDropdown(
      {super.key,
      required this.label,
      this.showAsterisk = false,
      required this.itemBuilder,
      required this.onSelected,
      required this.suggestionsCallback,
      required this.controller});

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

          TypeAheadField<T>(
            controller: controller,
            builder: (context, controller, focusNode) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                onTapOutside: (details) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: AppColors.activeBorderColor,
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(maxHeight: 24, maxWidth: 30),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: SvgPicture.asset(
                      AppImage.arrowDown,
                      height: 10,
                      width: 10,
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
              );
            },
            hideWithKeyboard: false,
            itemBuilder: itemBuilder,
            onSelected: onSelected,
            suggestionsCallback: suggestionsCallback,
          ),
        ],
      ),
    );
  }
}
