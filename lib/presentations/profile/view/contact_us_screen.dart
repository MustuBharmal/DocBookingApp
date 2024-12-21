import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/presentations/profile/widgets/custom_drop_down.dart';
import 'package:doc_booking_app/widgets/country_picker/custom_phone_field.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';

class ContactUsScreen extends GetView<ProfileController> {
  static const String routeName = '/contact-us-screen';

  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Contact Us',
        back: true,
        isVisible: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let us know about your query',
                style: txtInterTextField,
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
                  label: 'Preferred Communication Method',
                  showAsterisk: true,
                  selectedItem: controller.prefCommMethod.value,
                  items: controller.prefCommMethodList,
                  onChanged: (prefCommMethod) {
                    controller.prefCommMethod.value = prefCommMethod!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                child: CustomTextField(
                    label: 'Message',
                    maxLines: 6,
                    showAsterisk: true,
                    controller: controller.messageController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'Type your Message here'),
              ),
              BlueButton(label: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}