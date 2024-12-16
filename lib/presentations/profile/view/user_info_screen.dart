import 'package:doc_booking_app/global/styles.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/blue_button.dart';
import '../widgets/custom_drop_down.dart';
import '../../../widgets/custom_phone_field.dart';
import '../widgets/custom_profile_appbar.dart';
import '../../../widgets/custom_text_field.dart';
import '../widgets/profile_field.dart';
import '../widgets/profile_image.dart';

class UserInfoScreen extends GetView<ProfileController> {

  static const routeName = '/user-info-screen';

  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProfileAppBar(
        title: 'Profile',
        back: true,
        controller: controller,
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: controller.isEditingProfile.value == true
              ? _buildEditProfile(context)
              : _buildViewProfile(context),
        ),
      ),
    );
  }

  Widget _buildEditProfile(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(height: 20),
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
            onChanged: (value) {
              controller.phoneController.text = value;
            },
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
            items: controller.sexOptions,
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
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomDropdown(
            label: 'State',
            items: controller.stateList,
            selectedItem: controller.selectedState.value,
            showAsterisk: true,
            onChanged: (stateValue) {
              controller.selectedState.value = stateValue!;
            },
          ),
        ),
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
    );
  }

  Widget _buildViewProfile(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        ProfileImage(
          initialImageUrl:
              'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=o5Buqz1bYL-0yvutHptCw9Q9Du~5NUyQg7hPUu~Up5hK5~2MlwWiNoXDE09ElYH1JGSj~Ck4JQUOZLqFwmwPwYTTRNzT0oeoaa2Ebms9K5Fx5kQHV9nVlmms6A-j2Ar10u4AbtL4ShTDFdA6WOa5uBWpoGPpUXANiqebyiDrTV9LWtz5oSds91yMhcU6l-YksInL8b9s4TKb9eb4MfXuvflFyRTn3Q3q5xSxsXFF-rghYf0hY0J0dV~ZdXGkIk50KZj5fJ50sY59U1Mn2AqxsKBcvoht0l8~RBfdFybpmbAW0k07XrNNufO2CqXsDA5hlAeenCneKfovS~4EBmLdPg__',
          isEditing: false,
        ),
        const SizedBox(height: 25),
        ProfileField(label: 'Full Name', value: controller.nameController.text,),
        ProfileField(label:'Email Address', value: controller.emailController.text),
        ProfileField(label:'Phone Number', value: controller.phoneController.text),
        ProfileField(label:'DOB', value: controller.dobController.text),
        ProfileField(label: 'Sex', value:controller.selectedSex.value),
        ProfileField(label: 'Address', value: controller.addressController.text),
        ProfileField(label: 'Zip Code', value: controller.zipController.text),
        ProfileField(label: 'State', value: controller.selectedState.value),
      ],
    );
  }
}

