import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class CustomPinInput extends StatelessWidget {
  const CustomPinInput({super.key});

  @override
  Widget build(BuildContext context) {
    String validPin = "1234";
    final defaultPinTheme = PinTheme(
      width: Get.width * 0.205,
      height: Get.height * 0.067,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue, width: 2),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Form(
        child: Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          validator: (value) {
            return value == validPin ? "Pin is correct" : "Pin is incorrect";
          },
          onCompleted: (pin) {
            LogUtil.debug("Success $pin");
          },
        ),
      ),
    );
  }
}
