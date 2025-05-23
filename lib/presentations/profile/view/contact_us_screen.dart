import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/country_picker/custom_phone_field.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:doc_booking_app/widgets/custom_drop_down.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../../authentication/controller/authentication_controller.dart';

class ContactUsScreen extends GetView<ProfileController> {
  static const String routeName = '/contact-us-screen';

  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Contact Us',
        back: true,
        isNotificationVisible: false,
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
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                      isPassword: RxBool(false),
                      label: 'Full Name',
                      showAsterisk: true,
                      controller: controller.nameController,
                      hintStyle: txtInterTextFieldHint,
                      errorText:
                          ProfileController.instance.profileError['name'],
                      hintText: 'John Doe'),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                      isPassword: RxBool(false),
                      label: 'Email Address',
                      showAsterisk: true,
                      readOnly: true,
                      errorText:
                          ProfileController.instance.profileError['email'],
                      controller: controller.emailController,
                      hintStyle: txtInterTextFieldHint,
                      hintText: 'john.doe@gmail.com'),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomPhoneField(
                    controller: controller.phoneController,
                    errorText: ProfileController.instance.profileError['phone'],
                    countries: AuthController.instance.countries,
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomDropdown(
                    label: 'Preferred Communication Method',
                    showAsterisk: true,
                    errorText: ProfileController
                        .instance.profileError['communication_method'],
                    selectedItem: controller.prefCommMethod.value,
                    items: controller.prefCommMethodList,
                    onChanged: (prefCommMethod) {
                      controller.prefCommMethod.value = prefCommMethod!;
                    },
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                  child: CustomTextField(
                      isPassword: RxBool(false),
                      label: 'Message',
                      maxLines: 5,
                      showAsterisk: true,
                      errorText:
                          ProfileController.instance.profileError['message'],
                      controller: controller.messageController,
                      hintStyle: txtInterTextFieldHint,
                      hintText: 'Type your Message here'),
                ),
              ),
              BlueButton(
                label: 'Submit',
                onPressed: () {
                  if (!controller.contactUsValidation()) {
                    return;
                  }
                  var params = {
                    'name': controller.nameController.text,
                    'email': controller.emailController.text,
                    'phone': controller.phoneController.text,
                    'communication_method': controller.prefCommMethod.value,
                    'message': controller.messageController.text
                  };
                  controller.contactUs(params);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
