import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/forgot_password_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../../../widgets/custom_text_field.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({super.key});

  static const routeName = '/login-screen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: SizedBox(
                  width: Get.width * 0.591,
                  height: Get.height * 0.253,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(flex: 4, child: Image.asset(AppImage.appLogo)),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 30),
                    child: Text(ConstantString.signIn, style: headerTextStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomTextField(
                      isPassword: RxBool(false),
                      controller: emailController,
                      hintText: 'eg. xyz@gmail.com',
                      label: ConstantString.emailAddress,
                      hintStyle: txtInterTextFieldHint,
                      showAsterisk: true,
                    ),
                  ),
                  CustomTextField(
                    isPassword: RxBool(true),
                    controller: passController,
                    hintText: 'eg. 123',
                    label: ConstantString.password,
                    hintStyle: txtInterTextFieldHint,
                    showAsterisk: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.blue,
                            visualDensity: VisualDensity.compact,
                          ),
                          Text(ConstantString.rememberMe,
                              style: txtInterTextField),
                        ],
                      ),
                      // Forgot Password
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(ForgotPasswordScreen.routeName);
                        },
                        child: Text(
                          '${ConstantString.forgotPass}?',
                          style: blueNormalTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 18),
                    child: BlueButton(
                      label: ConstantString.signIn,
                      onPressed: () {
                        if (!emailController.text.isEmail) {
                          Get.snackbar('Error', 'Enter valid email.');
                          return;
                        }
                        if (passController.text.trim().length < 6) {
                          Get.snackbar('Error', 'Password length should be at least 6 characters.');
                          return;
                        }
                        controller.email = emailController.text;
                        controller.login(
                            emailController.text, passController.text);
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ConstantString.doNotHaveAcc,
                          style: normalTextStyle,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(SignupScreen.routeName);
                            },
                            child: Text(ConstantString.signUpHere,
                                style: blueNormalTextStyle))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
