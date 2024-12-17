import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/forgot_password_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_password_textfield.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/styles.dart';
import '../../../widgets/custom_text_field.dart';

class LoginScreen extends GetView<AuthenticationController> {
  const LoginScreen({super.key});

  static const routeName = "/login-screen";

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
                        "Doctor's Booking",
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
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 30),
                      child: Text('Sign in', style: headerTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomTextField(
                        controller: controller.emailController,
                        hintText: "eg. xyz@gmail.com",
                        label: "Email Address",
                        hintStyle: txtInterTextFieldHint,
                        showAsterisk: true,
                      ),
                    ),
                    CustomPasswordTextfield(
                        label: "Password",
                        showAsterisk: true,
                        isPasswordTextField: true,
                        textEditingController: controller.passController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: "eg. 123"),
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
                            Text('Remember me', style: txtInterTextField),
                          ],
                        ),
                        // Forgot Password
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(ForgotPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: blueNormalTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 18),
                      child: BlueButton(
                        label: "Sign In",
                        onPressed: () {
                          Get.offAllNamed(NavigationScreen.routeName);
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: normalTextStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offNamed(SignupScreen.routeName);
                              },
                              child: Text("Sign Up here",
                                  style: blueNormalTextStyle))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
