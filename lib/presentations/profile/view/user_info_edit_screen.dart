import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';
import '../../../global/constant_string.dart';
import '../../../global/images.dart';
import '../../../global/styles.dart';
import '../../../util/log_utils.dart';
import '../../../widgets/blue_button.dart';
import '../../../widgets/country_picker/custom_phone_field.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_dialogbox.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_text_field.dart';
import '../../authentication/controller/loader_controller.dart';
import '../../authentication/repo/auth_repo.dart';
import '../../authentication/widget/custom_dob_textfield.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .16,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Get.width * .35,
                          ),
                          width: Get.width * .3,
                          height: Get.height * .135,
                          child: controller.selectedImage.value?.path == null
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.imageUrl.value,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Image.file(
                                      File(controller.imageUrl.value),
                                      fit: BoxFit.contain,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.file(
                                    File(controller.selectedImage.value?.path ?? ''),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: -1,
                          left: 160,
                          child: GestureDetector(
                            onTap: () => controller.pickImage(),
                            // Trigger image picker
                            child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              radius: 19,
                              child: CircleAvatar(
                                radius: 16, // Size of the circle
                                backgroundColor: AppColors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  // Padding inside the circle
                                  child: Image.asset(
                                    width: 16,
                                    AppImage.camera,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: CustomTextField(
                      isPassword: RxBool(false),
                      label: 'Full Name',
                      controller: controller.nameController,
                      showAsterisk: true,
                      errorText: controller.profileError['name'],
                      hintStyle: txtInterTextFieldHint,
                      hintText: 'Alex Doe',
                    ),
                  ),
                  CustomTextField(
                    isPassword: RxBool(false),
                    label: 'Email Address',
                    readOnly: true,
                    errorText: controller.profileError['email'],
                    controller: controller.emailController,
                    showAsterisk: true,
                    hintStyle: txtInterTextFieldHint,
                    hintText: 'alex.doe@gmail.com',
                  ),
                  CustomPhoneField(
                    controller: controller.phoneController,
                    countries: AuthController.instance.countries,
                    errorText: controller.profileError['phone'],
                  ),
                  CustomDobTextField(
                    hintText: 'day/month/year',
                    hintStyle: txtInterTextFieldHint,
                    controller: controller.dobController,
                    label: ConstantString.dob,
                    showAsterisk: true,
                    errorText: controller.profileError['dob'],
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
                    errorText: controller.profileError['sex'],
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
                      errorText: controller.profileError['country'],
                      showDropDownIcon: true,
                      onTap: () {
                        controller.selectState.value = null;
                        if (AuthController
                            .instance.searchedCountries.isNotEmpty) {
                          TypeOfDialogs.showCommonBottomSheetDialog(
                            context,
                            'Country',
                            RxList.from(AuthController
                                .instance.searchedCountries
                                .where((country) => country.name != null)
                                .map((country) => country.name!)
                                .toList()),
                            RxList.from(AuthController
                                .instance.searchedCountries
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
                      errorText: controller.profileError['state'],
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
                      errorText: controller.profileError['city'],
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
                      errorText: controller.profileError['address'],
                      hintStyle: txtInterTextFieldHint,
                      hintText: 'Street 2334 , New York',
                    ),
                  ),
                  CustomTextField(
                    isPassword: RxBool(false),
                    label: ConstantString.postCode,
                    showAsterisk: true,
                    controller: controller.pinCodeController,
                    hintStyle: txtInterTextFieldHint,
                    inputType: TextInputType.number,
                    hintText: 'eg 12345',
                    errorText: controller.profileError['pin_code'],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: BlueButton(
                      label: 'Save',
                      onPressed: () async {
                        if (!controller.userEditProfileValidation()) {
                          return;
                        }
                        LoaderController.instance.showLoader();
                        String? profilePic = controller.imageUrl.value;
                        if (controller.selectedImage.value != null) {
                          profilePic = await AuthRepo.uploadProfilePic(
                              controller.selectedImage.value!,
                              showLoader: false);
                          if (profilePic == null) {
                            Get.snackbar('Error', 'Image Upload failed!');
                            return;
                          }
                        }
                        var params = {
                          'name': controller.nameController.text,
                          'email': controller.emailController.text,
                          'sex': controller.selectedSex.value,
                          'dob': controller.dobController.text,
                          'phone': controller.phoneController.text,
                          'address': controller.addressController.text,
                          'country': controller.countryController.text,
                          'state': controller.stateController.text,
                          'city': controller.cityController.text,
                          'profile_pic': profilePic,
                          'pin_code': controller.pinCodeController.text,
                        };
                        controller.updateProfile(params);

                        // Save profile logic
                        controller.isEditingProfile.value = false;
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
