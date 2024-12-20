import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_dob_textfield.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/profile/widgets/custom_drop_down.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_phone_field.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../models/user.dart';

class SignupScreen extends GetView<AuthenticationController> {
  SignupScreen({super.key});

  static const routeName = "/signup-screen";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstantString.signUn,
                    style: headerTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 25),
                    child: Text(ConstantString.createAccount,
                        style: txtInterTextField),
                  ),
                  Image.asset(AppImage.signUpCamera),
                  Text(
                    ConstantString.uploadPhoto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF899CA8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          label: ConstantString.fullName,
                          showAsterisk: true,
                          controller: fullNameController,
                          hintStyle: txtInterTextFieldHint,
                          hintText: "eg. Alex",
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: "eg. alex@gmail.com",
                    label: ConstantString.emailAddress,
                    hintStyle: txtInterTextFieldHint,
                    showAsterisk: true,
                  ),
                  CustomPhoneField(
                    controller: phoneController,
                  ),
                  CustomDobTextField(
                      hintText: "day/month/year",
                      hintStyle: txtInterTextFieldHint,
                      controller: dobController,
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
                      controller: addressController,
                      hintStyle: txtInterTextFieldHint,
                      hintText:
                          "eg 4517 Washington Ave. Manchester, Kentucky 39495"),
                  CustomTextField(
                      label: ConstantString.postCode,
                      showAsterisk: true,
                      controller: postCodeController,
                      hintStyle: txtInterTextFieldHint,
                      inputType: TextInputType.number,
                      hintText: "eg 12345"),
                  CustomTextField(
                      label: ConstantString.country,
                      showAsterisk: true,
                      controller: countryController,
                      hintStyle: txtInterTextFieldHint,
                      hintText: "eg india"),
                  Padding(
                    padding: const EdgeInsets.only(top: 19, bottom: 20),
                    child: BlueButton(
                      label: ConstantString.save,
                      onPressed: () {
                        Get.offNamed(NavigationScreen.routeName);
                      },
                    ),
                  )
                ],
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
                        User user = User(
                          name: fullNameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          sex: controller.selectSex.value,
                          dob: dobController.text,
                          address: addressController.text,
                          country: countryController.text,
                          state: '',
                          city: '',
                          password: '',
                          profilePic: '',
                        );
                        controller.signUp(user);
                      },
                      child: Text(
                        ConstantString.signInHere,
                        style: blueNormalTextStyle,
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
