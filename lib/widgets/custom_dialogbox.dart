import 'package:doc_booking_app/widgets/custom_common_Bottom_sheet.dart';
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
        searchControllers: controller,
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  static showCommonBottomSheetDialog(
      BuildContext context,
      String header,
      RxList<String> listOfItems,
      RxList<String> listOfEmojis,
      TextEditingController controller,Function (String value) selectFun) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return CustomCommonBottomSheetWidget(
          header: header,
          listOfItems: listOfItems,
          listOfEmojis:listOfEmojis,
          controller: controller,
          selectFun:selectFun,
        );
      },
    );
  }
}
