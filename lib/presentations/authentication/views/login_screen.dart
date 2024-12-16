import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_password_textfield.dart';
import 'package:doc_booking_app/util/log_utils.dart';
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
    LogUtil.debug("${Get.width * 0.591},${Get.height * 0.253}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
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
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 30),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color(0xFF363636),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomTextField(
                        controller: controller.emailController,
                        hintText: "Enter Email",
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
                        hintText: "Enter Password"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: Colors.blue,
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey, // Text color
                              ),
                            ),
                          ],
                        ),
                        // Forgot Password
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue, // Text color
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 18),
                      child: BlueButton(label: "Sign In"),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              color: Color(0xFF899CA8),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.offNamed(SignupScreen.routeName);
                              },
                              child: Text(
                                "Sign Up here",
                                style: TextStyle(
                                  color: Color(0xFF2268FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
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
