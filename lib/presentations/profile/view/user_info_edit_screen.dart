import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/country_picker/custom_phone_field.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_text_field.dart';
import '../widgets/profile_image.dart';

class UserInfoEditScreen extends GetView<ProfileController> {
  static const String routeName = '/user-info-edit-screen';

  const UserInfoEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        back: true,
        isNotificationVisible: false,
        // controller: controller,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileImage(
                initialImageUrl:
                    'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=K6IBc34oEZTfO2Fvozs1V5mOGqff6iQ2VdibX-AVW1PEa-NINVvXbtyW5GxTiM-QilLtF4umNkGK2I~ycyoL84ObJnkXqjSPG66CQxqe96IKYWBErFu5TyFkq8QbmKCBDTrbM5HGJjslognO0Zh4pqVrtsDaHVk0uNmXnBpDXJ0uPZTB~DXwEnhdGGQtbC6RAnSuSz87v5Xk80wePKvHneKP3q--U7rUvmY3oZ4-mi8K4uoVZ-3CVPpkVyx6ikPIkmQQStKqsjAgwUzzqEttW~apbi2TkvOP8rBmOralmwU8-bHRxltyYVxMRL9EuGHL2wJ9np7mcf34G1WgQKRing__',
                isEditing: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: CustomTextField(
                  isPassword: RxBool(false),
                  label: 'Full Name',
                  controller: controller.nameController,
                  showAsterisk: true,
                  hintStyle: txtInterTextFieldHint,
                  hintText: 'Alex Doe',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                  isPassword: RxBool(false),
                  label: 'Email Address',
                  controller: controller.emailController,
                  showAsterisk: true,
                  hintStyle: txtInterTextFieldHint,
                  hintText: 'alex.doe@gmail.com',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomPhoneField(
                  controller: controller.phoneController,
                  // onChanged: (value) {
                  //   controller.phoneController.text = value;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                  isPassword: RxBool(false),
                  label: 'DOB',
                  controller: controller.dobController,
                  showAsterisk: true,
                  hintStyle: txtInterTextFieldHint,
                  hintText: '27/02/1992',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomDropdown(
                  label: 'Sex',
                  items: controller.sexOptions
                  /*.map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: txtInterDropDownValue,
                              ),
                            ),
                          )
                          .toList()*/
                  ,
                  showAsterisk: true,
                  selectedItem: controller.selectedSex.value,
                  onChanged: (sexValue) {
                    controller.selectedSex.value = sexValue!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                  isPassword: RxBool(false),
                  label: 'Address',
                  controller: controller.addressController,
                  showAsterisk: true,
                  hintStyle: txtInterTextFieldHint,
                  hintText: 'Street 2334 , New York',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                  isPassword: RxBool(false),
                  label: 'Zip Code',
                  controller: controller.zipController,
                  showAsterisk: true,
                  hintStyle: txtInterTextFieldHint,
                  hintText: '53542',
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomDropdown(
                  label: 'State',
                  items: controller.stateList
                  *//*.map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: txtInterDropDownValue,
                              ),
                            ),
                          )
                          .toList()*//*
                  ,
                  selectedItem: controller.selectedState.value,
                  showAsterisk: true,
                  onChanged: (stateValue) {
                    controller.selectedState.value = stateValue!;
                  },
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: BlueButton(
                  label: 'Save',
                  onPressed: () {
                    // Save profile logic
                    controller.isEditingProfile.value = false;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
