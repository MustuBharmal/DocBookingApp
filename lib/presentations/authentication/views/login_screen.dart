import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/forgot_password_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_password_textfield.dart';
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
                      Image.asset(AppImage.appLogo),
                      Text(
                        ConstantString.doctorBooking,
                        style: TextStyle(
                          color: Color(0xFF2268FF),
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      )
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
                      controller: emailController,
                      hintText: 'eg. xyz@gmail.com',
                      label: ConstantString.emailAddress,
                      hintStyle: txtInterTextFieldHint,
                      showAsterisk: true,
                    ),
                  ),
                  CustomPasswordTextField(
                    label: ConstantString.password,
                    showAsterisk: true,
                    isPasswordTextField: true,
                    textEditingController: passController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'eg. 123',
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
                          Text(ConstantString.rememberMe, style: txtInterTextField),
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
                          return;
                        }
                        if (passController.text.trim().length < 6) {
                          return;
                        }
                        controller.email = emailController.text;
                        controller.login(emailController.text, passController.text);
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
                              Get.offNamed(SignupScreen.routeName);
                            },
                            child: Text(ConstantString.signUpHere, style: blueNormalTextStyle))
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
