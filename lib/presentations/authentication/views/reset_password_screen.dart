import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  static const routeName = '/reset-password-screen';
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

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
              SizedBox(
                height: 40,
              ),
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
                padding: const EdgeInsets.only(top: 18.0, bottom: 30),
                child: Text('Reset Password', style: headerTextStyle),
              ),
              CustomTextField(
                  label: ConstantString.newPassword,
                  showAsterisk: true,
                  controller: newPassController,
                  hintStyle: txtInterTextFieldHint,
                  hintText: '******'),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomTextField(
                    label: ConstantString.confirmPassword,
                    showAsterisk: true,
                    controller: confirmPassController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: '******'),
              ),
              BlueButton(
                label: ConstantString.continueLabel,
                onPressed: () {
                  AuthController.instance.resetPassword(
                      newPassController.text, confirmPassController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
