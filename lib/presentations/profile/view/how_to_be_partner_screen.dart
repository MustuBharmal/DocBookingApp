import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/country_picker/custom_phone_field.dart';
import '../../../widgets/custom_text_field.dart';
import '../../authentication/controller/authentication_controller.dart';

class HowToBePartnerScreen extends GetView<ProfileController> {
  static const String routeName = '/how-to-be-partner-screen';

  const HowToBePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'How to be Partner',
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
                'Tell us about your business -- we\'d be happy \nto partner with you on our journey!',
                style: txtInterTextField,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                    isPassword: RxBool(false),
                    label: 'Full Name',
                    showAsterisk: true,
                    controller: controller.nameController,
                    hintStyle: txtInterTextFieldHint,
                    errorText: ProfileController.instance.profileError['name'],
                    hintText: 'John Doe'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomTextField(
                    isPassword: RxBool(false),
                    label: 'Email Address',
                    showAsterisk: true,
                    readOnly: true,
                    controller: controller.emailController,
                    hintStyle: txtInterTextFieldHint,
                    errorText: ProfileController.instance.profileError['email'],
                    hintText: 'john.doe@gmail.com'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CustomPhoneField(
                  controller: controller.phoneController,
                  countries: AuthController.instance.countries,
                ),
              ),
              /*Padding(
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
              ),*/
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                      isPassword: RxBool(false),
                      label: 'Business Name',
                      showAsterisk: true,
                      controller: controller.businessNameController,
                      hintStyle: txtInterTextFieldHint,
                      errorText: ProfileController
                          .instance.profileError['business_name'],
                      hintText: 'Fitness First'),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                      isPassword: RxBool(false),
                      label: 'Business Type',
                      showAsterisk: true,
                      controller: controller.businessTypeController,
                      hintStyle: txtInterTextFieldHint,
                      errorText: ProfileController
                          .instance.profileError['business_type'],
                      hintText: 'Clinic'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 20),
                child: Text(
                  'Our support team will reach out to you within \nthree business days.',
                  style: txtInterTextField,
                ),
              ),
              BlueButton(
                  label: 'Submit',
                  onPressed: () {
                    if (!controller.htbValidation()) {
                      return;
                    }
                    var params = {
                      'name': controller.nameController.text,
                      'email': controller.emailController.text,
                      'phone': controller.phoneController.text,
                      'business_type': controller.businessTypeController.text,
                      'business_name': controller.businessNameController.text,
                    };

                    controller.howToBePartner(params);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
