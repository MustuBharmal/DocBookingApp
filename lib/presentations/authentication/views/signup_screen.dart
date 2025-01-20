import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_screen.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_dob_textfield.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/country_picker/custom_phone_field.dart';
import 'package:doc_booking_app/widgets/custom_drop_down.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global/styles.dart';
import '../../../widgets/custom_dialogbox.dart';

class SignupScreen extends GetView<AuthController> {
  SignupScreen({super.key});

  static const routeName = '/signup-screen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (pop, result) {
        if (pop) {
          controller.signupError.clear();
          controller.selectedImageSignup.value = null;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            // backgroundColor: Colors.white,
            ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstantString.signUp,
                      style: headerTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 25),
                      child: Text(ConstantString.createAccount,
                          style: txtInterTextField),
                    ),
                    Obx(
                      () => Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(21)),
                        child: DottedBorder(
                          color: AppColors.borderColor,
                          radius: Radius.circular(20),
                          borderType: BorderType.RRect,
                          stackFit: StackFit.passthrough,
                          dashPattern: [4, 3],
                          borderPadding: EdgeInsets.all(1),
                          child: Container(
                            decoration:
                                controller.selectedImageSignup.value != null
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        image: DecorationImage(
                                            image: FileImage(controller
                                                .selectedImageSignup.value!),
                                            fit: BoxFit.cover))
                                    : null,
                            child: controller.selectedImageSignup.value == null
                                ? Center(
                                    child: SvgPicture.asset(AppImage.icCamera))
                                : null,
                          ),
                        ),
                      ).onClick(() {
                        LogUtil.debug('hello');
                        Get.bottomSheet(profileBottomSheet());
                      }),
                    ),
                    if (controller.signupError['profile_pic'] != null)
                      Text(
                        controller.signupError['profile_pic']!,
                        style: TextStyle(color: AppColors.errorTextColor),
                      ),
                    Text(
                      ConstantString.uploadPhoto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF899CA8),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(false),
                        label: ConstantString.fullName,
                        showAsterisk: true,
                        controller: fullNameController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: 'eg. Alex',
                        errorText: controller.signupError['name'],
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(false),
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        hintText: 'eg. alex@gmail.com',
                        label: ConstantString.emailAddress,
                        hintStyle: txtInterTextFieldHint,
                        showAsterisk: true,
                        errorText: controller.signupError['email'],
                      ),
                    ),
                    Obx(
                      () => CustomPhoneField(
                        controller: phoneController,
                        countries: controller.countries,
                        errorText: controller.signupError['phone'],
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(true),
                        controller: passController,
                        hintText: 'eg. 123',
                        label: ConstantString.password,
                        hintStyle: txtInterTextFieldHint,
                        showAsterisk: true,
                        errorText: controller.signupError['password'],
                      ),
                    ),
                    Obx(
                      () => CustomDobTextField(
                        hintText: 'day/month/year',
                        hintStyle: txtInterTextFieldHint,
                        controller: dobController,
                        label: ConstantString.dob,
                        showAsterisk: true,
                        errorText: controller.signupError['dob'],
                        validator: null,
                      ),
                    ),
                    Obx(
                      () => CustomDropdown(
                        label: ConstantString.sex,
                        showAsterisk: true,
                        items: ['Male', 'Female', 'Other'],
                        selectedItem: controller.selectSex.value,
                        onChanged: (String? gender) {
                          if (gender != null) {
                            sexController.text = gender;
                            controller.selectSex.value = gender;
                          }
                        },
                        errorText: controller.signupError['sex'],
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(false),
                        label: ConstantString.address,
                        showAsterisk: true,
                        controller: addressController,
                        hintStyle: txtInterTextFieldHint,
                        hintText:
                            'eg 4517 Washington Ave. Manchester, Kentucky 39495',
                        errorText: controller.signupError['address'],
                      ),
                    ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(false),
                        label: 'Country',
                        showAsterisk: true,
                        readOnly: true,
                        controller: countryController,
                        hintStyle: txtInterTextFieldHint,
                        inputType: TextInputType.number,
                        hintText: '',
                        errorText: controller.signupError['country'],
                        showDropDownIcon: true,
                        onTap: () {
                          controller.selectState.value = null;
                          if (controller.searchedCountries.isNotEmpty) {
                            TypeOfDialogs.showCommonBottomSheetDialog(
                              context,
                              'Country',
                              RxList.from(controller.searchedCountries
                                  .where((country) => country.name != null)
                                  .map((country) => country.name!)
                                  .toList()),
                              RxList.from(controller.searchedCountries
                                  .where((country) => country.emoji != null)
                                  .map((country) => country.emoji!)
                                  .toList()),
                              countryController,
                              controller.getStatesAndCountry,
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
                        controller: stateController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: '',
                        errorText: controller.signupError['state'],
                        showDropDownIcon: true,
                        onTap: () {
                          controller.selectState.value = null;
                          if (controller.states.isNotEmpty) {
                            TypeOfDialogs.showCommonBottomSheetDialog(
                              context,
                              'State',
                              RxList.from(controller.states
                                  .where((state) => state.name != null)
                                  .map((state) => state.name!)
                                  .toList()),
                              RxList.empty(),
                              stateController,
                              controller.getCitiesAndState,
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
                        controller: cityController,
                        hintStyle: txtInterTextFieldHint,
                        hintText: 'eg. Rajkot',
                        errorText: controller.signupError['city'],
                      ),
                    ),

                    // CustomTextField(
                    //     isPassword: RxBool(false),
                    //     label: 'City',
                    //     showAsterisk: true,
                    //     readOnly: true,
                    //     controller: cityController,
                    //     hintStyle: txtInterTextFieldHint,
                    //     hintText: '',
                    //     errorText: controller.signupError['city'],
                    //     // showDropDownIcon: true,
                    //     // onTap: () {
                    //     //   controller.selectCity.value = null;
                    //     //   if (controller.cities.isNotEmpty) {
                    //     //     TypeOfDialogs.showCommonBottomSheetDialog(
                    //     //       context,
                    //     //       'City',
                    //     //       RxList.from(controller.cities
                    //     //           .where((city) => city.name != null)
                    //     //           .map((city) => city.name!)
                    //     //           .toList()),
                    //     //       RxList.empty(),
                    //     //       cityController,
                    //     //       controller.getCity,
                    //     //     );
                    //     //   } else {
                    //     //     LogUtil.debug('hello');
                    //     //   }
                    //     // },
                    //   ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(false),
                        label: ConstantString.postCode,
                        showAsterisk: true,
                        controller: postCodeController,
                        hintStyle: txtInterTextFieldHint,
                        inputType: TextInputType.text,
                        hintText: 'eg 12345',
                        errorText: controller.signupError['pin_code'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19, bottom: 20),
                      child: BlueButton(
                        label: ConstantString.save,
                        onPressed: () {
                          controller.signUp(
                            name: fullNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passController.text,
                            dob: dobController.text,
                            sex: sexController.text,
                            address: addressController.text,
                            city: cityController.text,
                            state: stateController.text,
                            country: countryController.text,
                            pinCode: postCodeController.text,
                            // lat: double.parse(controller.selectCity.value?.latitude ?? '0.0') ,
                            // long: double.parse(controller.selectCity.value?.longitude ?? '0.0'),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantString.alreadyHaveAcc,
                        style: normalTextStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          ConstantString.signInHere,
                          style: blueNormalTextStyle,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileBottomSheet() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15))),
      padding: const EdgeInsets.only(
        top: 20,
        // vertical: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Capture Image',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () async {
                  Get.back();
                  controller.pickImageSignup(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                ),
                label: const Text(
                  'Camera',
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  Get.back();
                  controller.pickImageSignup(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.image_outlined,
                ),
                label: const Text(
                  'Gallery',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
