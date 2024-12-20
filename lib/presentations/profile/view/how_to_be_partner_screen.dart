import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/custom_drop_down.dart';
import '../../../widgets/country_picker/custom_phone_field.dart';
import '../../../widgets/custom_text_field.dart';

class HowToBePartnerScreen extends GetView<ProfileController>{
  static const String routeName = '/how-to-be-partner-screen';
const HowToBePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'How to be Partner',
        back: true,
        isVisible: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Tell us about your business -- we\'d be happy \nto partner with you on our journey!',
                  style: txtInterTextField,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                    label: 'Full Name',
                    showAsterisk: true,
                    controller: controller.nameController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'John Doe'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                    label: 'Email Address',
                    showAsterisk: true,
                    controller: controller.emailController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'john.doe@gmail.com'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomPhoneField(controller: controller.phoneController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomDropdown(
                  label: 'Business Name',
                  showAsterisk: true,
                  selectedItem: controller.selectedBusinessName.value,
                  items: controller.businessNamesList,
                  onChanged: (selectedBusinessName) {
                    controller.selectedBusinessName.value = selectedBusinessName!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomDropdown(
                  label: 'Business Type',
                  showAsterisk: true,
                  selectedItem: controller.selectedBusinessType.value,
                  items: controller.businessTypesList,
                  onChanged: (selectedBusinessType) {
                    controller.selectedBusinessType.value = selectedBusinessType!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 10,bottom: 20),
                child: Text(
                  'Our support team will reach out to you within \nthree business days.',
                  style: txtInterTextField,
                ),
              ),

              BlueButton(label: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
