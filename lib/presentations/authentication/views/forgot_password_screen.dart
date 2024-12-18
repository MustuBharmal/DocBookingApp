import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/account_verification_screen.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class ForgotPasswordScreen extends GetView<AuthenticationController> {
  const ForgotPasswordScreen({super.key});

  static const routeName = "/forgot_password-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 18),
              child: Container(
                width: 44,
                height: 44,
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
            Text(ConstantString.forgotPass, style: headerTextStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                ConstantString.subTextForForgot,
                style: txtInterTextField,
              ),
            ),
            CustomTextField(
                label: ConstantString.emailAddress,
                showAsterisk: true,
                controller: controller.emailController,
                hintStyle: txtInterTextFieldHint,
                hintText: "eg. xyz@gmail.com"),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: BlueButton(
                label: ConstantString.continueLabel,
                onPressed: () {
                  Get.offNamed(AccountVerificationScreen.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
