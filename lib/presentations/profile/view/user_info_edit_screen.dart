import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/constant_string.dart';
import '../../../global/styles.dart';
import '../../../util/log_utils.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/country_picker/custom_phone_field.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_dialogbox.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_text_field.dart';
import '../../authentication/widget/custom_dob_textfield.dart';
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
                initialImageUrl: controller.imageUrl.value,
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
              CustomTextField(
                isPassword: RxBool(false),
                label: 'Email Address',
                readOnly: true,
                controller: controller.emailController,
                showAsterisk: true,
                hintStyle: txtInterTextFieldHint,
                hintText: 'alex.doe@gmail.com',
              ),
              CustomPhoneField(
                controller: controller.phoneController,
                countries: AuthController.instance.countries,
                errorText: AuthController.instance.signupError['phone'],
              ),
              CustomDobTextField(
                hintText: 'day/month/year',
                hintStyle: txtInterTextFieldHint,
                controller: controller.dobController,
                label: ConstantString.dob,
                showAsterisk: true,
                errorText: AuthController.instance.signupError['dob'],
                validator: null,
              ),
              CustomDropdown(
                label: ConstantString.sex,
                showAsterisk: true,
                items: ['Male', 'Female', 'Other'],
                selectedItem: controller.selectedSex.value,
                onChanged: (String? gender) {
                  if (gender != null) {
                    controller.selectedSex.value = gender;
                  }
                },
                errorText: AuthController.instance.signupError['sex'],
              ),
              Obx(
                    () => CustomTextField(
                  isPassword: RxBool(false),
                  label: 'Country',
                  showAsterisk: true,
                  readOnly: true,
                  controller: controller.countryController,
                  hintStyle: txtInterTextFieldHint,
                  inputType: TextInputType.number,
                  hintText: '',
                  errorText: AuthController.instance.signupError['country'],
                  showDropDownIcon: true,
                  onTap: () {
                    controller.selectState.value = null;
                    if (AuthController.instance.searchedCountries.isNotEmpty) {
                      TypeOfDialogs.showCommonBottomSheetDialog(
                        context,
                        'Country',
                        RxList.from(AuthController.instance.searchedCountries
                            .where((country) => country.name != null)
                            .map((country) => country.name!)
                            .toList()),
                        RxList.from(AuthController.instance.searchedCountries
                            .where((country) => country.emoji != null)
                            .map((country) => country.emoji!)
                            .toList()),
                        controller.countryController,
                        AuthController.instance.getStatesAndCountry,
                      );
                    } else {
                      LogUtil.debug('hello');
                    }
                  },
                ),
              ),
              Obx(
                    () => CustomTextField(
                  isPassword: RxBool(false),
                  label: 'State',
                  showAsterisk: true,
                  readOnly: true,
                  controller: controller.stateController,
                  hintStyle: txtInterTextFieldHint,
                  hintText: '',
                  errorText: AuthController.instance.signupError['state'],
                  showDropDownIcon: true,
                  onTap: () {
                    controller.selectState.value = null;
                    if (AuthController.instance.states.isNotEmpty) {
                      TypeOfDialogs.showCommonBottomSheetDialog(
                        context,
                        'State',
                        RxList.from(AuthController.instance.states
                            .where((state) => state.name != null)
                            .map((state) => state.name!)
                            .toList()),
                        RxList.empty(),
                        controller.stateController,
                        AuthController.instance.getCitiesAndState,
                      );
                    } else {
                      LogUtil.debug('hello');
                    }
                  },
                ),
              ),
              Obx(
                    () => CustomTextField(
                  isPassword: RxBool(false),
                  label: 'City',
                  showAsterisk: true,
                  readOnly: true,
                  controller: controller.cityController,
                  hintStyle: txtInterTextFieldHint,
                  hintText: '',
                  errorText: AuthController.instance.signupError['city'],
                  showDropDownIcon: true,
                  onTap: () {
                    controller.selectCity.value = null;
                    if (AuthController.instance.cities.isNotEmpty) {
                      TypeOfDialogs.showCommonBottomSheetDialog(
                        context,
                        'City',
                        RxList.from(AuthController.instance.cities
                            .where((city) => city.name != null)
                            .map((city) => city.name!)
                            .toList()),
                        RxList.empty(),
                        controller.cityController,
                        AuthController.instance.getCity,
                      );
                    } else {
                      LogUtil.debug('hello');
                    }
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
              CustomTextField(
                isPassword: RxBool(false),
                label: ConstantString.postCode,
                showAsterisk: true,
                controller: controller.postCodeController,
                hintStyle: txtInterTextFieldHint,
                inputType: TextInputType.number,
                hintText: 'eg 12345',
                errorText: AuthController.instance.signupError['pin_code'],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10.0),
              //   child: CustomTextField(
              //     isPassword: RxBool(false),
              //     label: 'Zip Code',
              //     controller: controller.zipController,
              //     showAsterisk: true,
              //     hintStyle: txtInterTextFieldHint,
              //     hintText: '53542',
              //   ),
              // ),
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
