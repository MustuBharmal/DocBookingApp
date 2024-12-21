import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/state_model.dart';
import 'package:doc_booking_app/presentations/authentication/widget/custom_dob_textfield.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/profile/widgets/custom_country_state_drop_down.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/country_picker/custom_phone_field.dart';
import 'package:doc_booking_app/widgets/custom_drop_down.dart';
import 'package:doc_booking_app/widgets/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../global/styles.dart';
import '../widget/custom_password_textfield.dart';

class SignupScreen extends GetView<AuthController> {
  SignupScreen({super.key});

  static const routeName = "/signup-screen";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ConstantString.signUn,
                    style: headerTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 25),
                    child: Text(ConstantString.createAccount, style: txtInterTextField),
                  ),
                  Obx(
                    () => Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(21)),
                      child: DottedBorder(
                        color: AppColors.borderColor,
                        radius: Radius.circular(20),
                        borderType: BorderType.RRect,
                        stackFit: StackFit.passthrough,
                        dashPattern: [4, 3],
                        borderPadding: EdgeInsets.all(1),
                        child: Container(
                          decoration: controller.selectedImageSignup.value != null
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  image:
                                      DecorationImage(image: FileImage(controller.selectedImageSignup.value!), fit: BoxFit.cover))
                              : null,
                          child: controller.selectedImageSignup.value == null
                              ? Center(child: SvgPicture.asset(AppImage.icCamera))
                              : null,
                        ),
                      ),
                    ).onClick(() {
                      controller.pickImageSignup();
                    }),
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
                  Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          label: ConstantString.fullName,
                          showAsterisk: true,
                          controller: fullNameController,
                          hintStyle: txtInterTextFieldHint,
                          hintText: "eg. Alex",
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: "eg. alex@gmail.com",
                    label: ConstantString.emailAddress,
                    hintStyle: txtInterTextFieldHint,
                    showAsterisk: true,
                  ),
                  CustomPhoneField(
                    controller: phoneController,
                    countries: controller.countries,
                    // selectedCountry: controller.selectedCountrySingUp.value,
                  ),
                  CustomPasswordTextfield(
                    label: ConstantString.password,
                    showAsterisk: true,
                    isPasswordTextField: true,
                    textEditingController: passController,
                    hintStyle: txtInterTextFieldHint,
                    hintText: "eg. 123",
                  ),
                  CustomDobTextField(
                      hintText: "day/month/year",
                      hintStyle: txtInterTextFieldHint,
                      controller: dobController,
                      label: ConstantString.dob,
                      showAsterisk: true,
                      validator: null),
                  CustomDropdown(
                      label: ConstantString.sex,
                      showAsterisk: true,
                      items: ["Male", "Female", "Other"]

                      ,
                      selectedItem: controller.selectSex.value,
                      onChanged: (String? gender) {
                        controller.selectSex.value = gender!;
                      }),
                  CustomTextField(
                      label: ConstantString.address,
                      showAsterisk: true,
                      controller: addressController,
                      hintStyle: txtInterTextFieldHint,
                      hintText: "eg 4517 Washington Ave. Manchester, Kentucky 39495"),
                  CustomTextField(
                      label: ConstantString.postCode,
                      showAsterisk: true,
                      controller: postCodeController,
                      hintStyle: txtInterTextFieldHint,
                      inputType: TextInputType.number,
                      hintText: "eg 12345"),
                  CustomCountryStateDropdown<StateModel>(
                    label: 'State',
                    controller: stateController,
                    itemBuilder: (_, country) => ListTile(
                      title: Text(
                        country.name ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onSelected: (StateModel state) {
                      controller.selectState.value = state;
                      stateController.text = state.name ?? '';
                    },
                    showAsterisk: true,
                    suggestionsCallback: (String value) async {
                      controller.searchState(value);
                      return controller.searchedStates;
                      /*return controller.states
                          .where((country) => country.name?.toLowerCase().startsWith(value.toLowerCase()) ?? false)
                          .toList();*/
                    },
                  ),
                  CustomCountryStateDropdown<CountryModel>(
                    label: 'Country',
                    controller: countryController,
                    itemBuilder: (_, country) => ListTile(
                      leading: Text(
                        country.emoji ?? '',
                        style: TextStyle(fontSize: 22),
                      ),
                      title: Text(
                        country.name ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onSelected: (CountryModel country) {
                      controller.selectCountry.value = country;
                      controller.getStates(country.id);
                      stateController.clear();
                      countryController.text = country.name ?? '';
                    },
                    showAsterisk: true,
                    suggestionsCallback: (String value) async {
                      return controller.countries
                          .where((country) => country.name?.toLowerCase().startsWith(value.toLowerCase()) ?? false)
                          .toList();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 19, bottom: 20),
                    child: BlueButton(
                      label: ConstantString.save,
                      onPressed: () {
                        Get.offNamed(NavigationScreen.routeName);
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
                        /*User user = User(
                          name: fullNameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          sex: controller.selectSex.value,
                          dob: dobController.text,
                          address: addressController.text,
                          country: countryController.text,
                          state: '',
                          city: '',
                          password: '',
                          profilePic: '',
                        );*/
                        // controller.signUp(user);
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
    );
  }
}
