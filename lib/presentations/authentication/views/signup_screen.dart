import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_screen.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_dob_textfield.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_image_container.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/profile/widgets/custom_drop_down.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
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
        child: SingleChildScrollView(
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
                    Form(
                      child: Column(
                        children: [
                          CustomTextField(
                              label: "Full Name",
                              showAsterisk: true,
                              controller: controller.fullNameController,
                              hintStyle: txtInterTextFieldHint,
                              hintText: "Enter FullName"),
                        ],
                      ),
                    ),
                    CustomTextField(
                      controller: controller.emailController,
                      hintText: "Enter Email",
                      label: "Email Address",
                      hintStyle: txtInterTextFieldHint,
                      showAsterisk: true,
                    ),
                    CustomPhoneField(controller: controller.phoneController),
                    CustomDobTextfield(
                        hintText: "Enter DOB",
                        hintStyle: txtInterTextFieldHint,
                        controller: controller.dobController,
                        label: "DOB",
                        showAsterisk: true,
                        validator: null),
                    CustomDropdown(
                        label: "Sex",
                        showAsterisk: true,
                        items: ["Male", "Female", "Other"],
                        selectedItem: controller.selectSex.value,
                        onChanged: (gender) {
                          controller.selectSex.value = gender!;
                        }),
                    CustomTextField(
                        label: "Address",
                        showAsterisk: true,
                        controller: controller.addressController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: "Enter Address"),
                    CustomTextField(
                        label: "Post Code",
                        showAsterisk: true,
                        controller: controller.postCodeController,
                        hintStyle: txtInterTextFieldHint,
                        inputType: TextInputType.number,
                        hintText: "Post Code"),
                    CustomTextField(
                        label: "Country",
                        showAsterisk: true,
                        controller: controller.countryController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: "Enter country"),
                    Padding(
                      padding: const EdgeInsets.only(top: 19, bottom: 20),
                      child: BlueButton(
                        label: "Save",
                        onPressed: () {
                          Get.offAllNamed(NavigationScreen.routeName);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: normalTextStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(LoginScreen.routeName);
                        },
                        child: Text("Sign In here", style: blueNormalTextStyle))
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
