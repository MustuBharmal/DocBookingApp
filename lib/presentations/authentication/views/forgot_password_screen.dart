import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  ForgotPasswordScreen({super.key});

  static const routeName = '/forgot_password-screen';
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0,bottom: 10),
                child: Text(ConstantString.forgotPass, style: headerTextStyle),
              ),
              Text(
                ConstantString.subTextForForgot,
                style: txtInterTextField,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0,bottom: 30),
                child: CustomTextField(
                    label: ConstantString.emailAddress,
                    showAsterisk: true,
                    controller: emailController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'eg. xyz@gmail.com'),
              ),
              BlueButton(
                label: ConstantString.continueLabel,
                onPressed: () {
                  controller.email = emailController.text;
                  controller.forgetPasswordEmail(emailController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
