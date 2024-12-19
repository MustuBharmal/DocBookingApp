import 'package:doc_booking_app/global/constant_string.dart';
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
                        ConstantString.signUn,
                        style: headerTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(ConstantString.createAccount,
                          style: txtInterTextField),
                    ),
                    CustomImageContainer(),
                    SizedBox(height: 5),
                    Text(
                      ConstantString.uploadPhoto,
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
                              label: ConstantString.fullName,
                              showAsterisk: true,
                              controller: controller.fullNameController,
                              hintStyle: txtInterTextFieldHint,
                              hintText: "eg. Alex"),
                        ],
                      ),
                    ),
                    CustomTextField(
                      controller: controller.emailController,
                      hintText: "eg. alex@gmail.com",
                      label: ConstantString.emailAddress,
                      hintStyle: txtInterTextFieldHint,
                      showAsterisk: true,
                    ),
                    CustomPhoneField(
                      controller: controller.phoneController,
                    ),
                    CustomDobTextField(
                        hintText: "day/month/year",
                        hintStyle: txtInterTextFieldHint,
                        controller: controller.dobController,
                        label: ConstantString.dob,
                        showAsterisk: true,
                        validator: null),
                    CustomDropdown(
                        label: ConstantString.sex,
                        showAsterisk: true,
                        items: ["Male", "Female", "Other"],
                        selectedItem: controller.selectSex.value,
                        onChanged: (gender) {
                          controller.selectSex.value = gender!;
                        }),
                    CustomTextField(
                        label: ConstantString.address,
                        showAsterisk: true,
                        controller: controller.addressController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: "eg 4517 Washington Ave. Manchester, Kentucky 39495"),
                    CustomTextField(
                        label: ConstantString.postCode,
                        showAsterisk: true,
                        controller: controller.postCodeController,
                        hintStyle: txtInterTextFieldHint,
                        inputType: TextInputType.number,
                        hintText: "eg 12345"),
                    CustomTextField(
                        label: ConstantString.country,
                        showAsterisk: true,
                        controller: controller.countryController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: "eg india"),
                    Padding(
                      padding: const EdgeInsets.only(top: 19, bottom: 20),
                      child: BlueButton(
                        label: ConstantString.save,
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
                      ConstantString.alreadyHaveAcc,
                      style: normalTextStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(LoginScreen.routeName);
                        },
                        child: Text(ConstantString.signInHere,
                            style: blueNormalTextStyle))
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
