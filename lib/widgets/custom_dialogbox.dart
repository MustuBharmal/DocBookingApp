import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_bottom_sheet_widget.dart';

class TypeOfDialogs {
  static showBottomSheetDialog(BuildContext context, String header,
      List<String> listOfItems, TextEditingController controller) {
    Get.bottomSheet(
      CustomBottomSheetWidget(
        header: header,
        listOfItems: listOfItems,
        controllers: controller,
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }
}
