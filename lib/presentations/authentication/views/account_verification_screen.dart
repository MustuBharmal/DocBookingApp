import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_pin_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';
import '../../../widgets/blue_button.dart';
import '../controller/otp_timer_controller.dart';

class AccountVerificationScreen extends GetView<OTPVerificationController> {
  AccountVerificationScreen({super.key});

  static const routeName = '/account_verification-screen';

  //why we use controller here ?
  /* because of when user move to verification screen then start timer. so controller initialized  when user move to verification screen
   otherwise timer will start when controller initialized.
   */
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //icon for back
            Padding(
              padding: const EdgeInsets.only(top: 41, bottom: 18),
              child: Container(
                width: Get.width * 0.1224,
                height: Get.height * 0.0583,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    shape: BoxShape.circle,
                    color: AppColors.white),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ),
            Text(ConstantString.accVerification, style: headerTextStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                'Please enter the OTP you received to ${AuthController.instance.email} ',
                style: txtInterTextField,
              ),
            ),
            CustomPinInput(pinController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.timerText.value == 'Resend') {
                      controller.resetTimer();
                    }
                  },
                  child: Obx(
                    () => Text(
                      controller.timerText.value == 'Resend'
                          ? 'Resend the code'
                          : 'Resend the code',
                      style: TextStyle(
                        fontSize: 16,
                        color: controller.timerText.value == 'Resend'
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Obx(() => Text(
                      controller.timerText.value == 'Resend'
                          ? ''
                          : controller.timerText.value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: BlueButton(
                label: ConstantString.verifyNow,
                onPressed: () {
                  controller.verifyOtp(
                    AuthController.instance.email!,
                    pinController.text,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
