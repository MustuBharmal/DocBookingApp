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
                    'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=o5Buqz1bYL-0yvutHptCw9Q9Du~5NUyQg7hPUu~Up5hK5~2MlwWiNoXDE09ElYH1JGSj~Ck4JQUOZLqFwmwPwYTTRNzT0oeoaa2Ebms9K5Fx5kQHV9nVlmms6A-j2Ar10u4AbtL4ShTDFdA6WOa5uBWpoGPpUXANiqebyiDrTV9LWtz5oSds91yMhcU6l-YksInL8b9s4TKb9eb4MfXuvflFyRTn3Q3q5xSxsXFF-rghYf0hY0J0dV~ZdXGkIk50KZj5fJ50sY59U1Mn2AqxsKBcvoht0l8~RBfdFybpmbAW0k07XrNNufO2CqXsDA5hlAeenCneKfovS~4EBmLdPg__',
                isEditing: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: CustomTextField(
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
