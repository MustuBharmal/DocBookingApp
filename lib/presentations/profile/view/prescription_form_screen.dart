import 'package:doc_booking_app/global/styles.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/controller/authentication_controller.dart';

class PrescriptionFormScreen extends GetView<ProfileController> {
  static const String routeName = '/prescription-form-screen';

  const PrescriptionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Obx(
                () => CustomTextField(
                    isPassword: RxBool(false),
                    label: 'Symptoms',
                    showAsterisk: true,
                    errorText: controller.profileError['blood_group'],
                    controller: controller.symptomsController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'Headache, Fever'),
              ),
              Obx(
                () => CustomTextField(
                    isPassword: RxBool(false),
                    label: 'Blood Group',
                    showAsterisk: true,
                    errorText: controller.profileError['symptoms'],
                    controller: controller.bloodGrpController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'O+'),
              )
            ],
          ),
          BlueButton(
            label: 'Submit',
            onPressed: () {
              if (!ProfileController.instance.prescriptionFormValidation()) {
                return;
              }
              var params = {
                'patient_id': AuthController.instance.user.value!.id,
                'doctor_id': controller.currDocId,
                'blood_group': controller.bloodGrpController.text,
                'symptoms': controller.symptomsController.text,
              };
              LogUtil.debug(params);
              controller.prescriptionForm(params);
              controller.symptomsController.clear();
              controller.bloodGrpController.clear();
            },
          )
        ],
      ),
    );
  }
}
