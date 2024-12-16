import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_image_container.dart';
import 'package:doc_booking_app/widgets/custom_phone_field.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';

class SignupScreen extends GetView<AuthenticationController> {
  const SignupScreen({super.key});

  static const routeName = "/signup-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF363636),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      'Let’s create your account',
                      style: TextStyle(
                        color: Color(0xFF899CA8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  CustomImageContainer(),
                  SizedBox(height: 5),
                  Text(
                    'Upload Photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF899CA8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Column(
                    children: [
                      CustomTextField(
                          label: "Full Name",
                          showAsterisk: true,
                          controller: controller.fullNameController,
                          hintStyle: txtInterTextFieldHint,
                          hintText: "Enter FullName"),
                    ],
                  ),
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: "Enter Email",
                    label: "Email Address",
                    hintStyle: txtInterTextFieldHint,
                    showAsterisk: true,
                  ),
                  CustomPhoneField(controller: controller.phoneController),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
