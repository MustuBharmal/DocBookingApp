import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/global/constant_string.dart';
import 'package:doc_booking_app/global/extensions.dart';
import 'package:doc_booking_app/global/images.dart';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
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

import '../../../global/styles.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,
          ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
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
                                    image: DecorationImage(
                                        image: FileImage(controller.selectedImageSignup.value!), fit: BoxFit.cover))
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
                    CustomTextField(
                      isPassword: RxBool(false),
                      label: ConstantString.fullName,
                      showAsterisk: true,
                      controller: fullNameController,
                      hintStyle: txtInterTextFieldHint,
                      hintText: 'eg. Alex',
                      errorText: controller.signupError['name'],
                    ),
                    CustomTextField(
                      isPassword: RxBool(false),
                      controller: emailController,
                      hintText: 'eg. alex@gmail.com',
                      label: ConstantString.emailAddress,
                      hintStyle: txtInterTextFieldHint,
                      showAsterisk: true,
                      errorText: controller.signupError['email'],
                    ),
                    CustomPhoneField(
                      controller: phoneController,
                      countries: controller.countries,
                      errorText: controller.signupError['phone'],
                    ),
                    CustomTextField(
                      isPassword: RxBool(true),
                      controller: passController,
                      hintText: 'eg. 123',
                      label: ConstantString.password,
                      hintStyle: txtInterTextFieldHint,
                      showAsterisk: true,
                      errorText: controller.signupError['password'],
                    ),
                    CustomDobTextField(
                      hintText: 'day/month/year',
                      hintStyle: txtInterTextFieldHint,
                      controller: dobController,
                      label: ConstantString.dob,
                      showAsterisk: true,
                      errorText: controller.signupError['dob'],
                      validator: null,
                    ),
                    CustomDropdown(
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
                    CustomTextField(
                      isPassword: RxBool(false),
                      label: ConstantString.address,
                      showAsterisk: true,
                      controller: addressController,
                      hintStyle: txtInterTextFieldHint,
                      hintText: 'eg 4517 Washington Ave. Manchester, Kentucky 39495',
                      errorText: controller.signupError['address'],
                    ),
                    CustomTextField(
                      isPassword: RxBool(false),
                      label: ConstantString.postCode,
                      showAsterisk: true,
                      controller: postCodeController,
                      hintStyle: txtInterTextFieldHint,
                      inputType: TextInputType.number,
                      hintText: 'eg 12345',
                      errorText: controller.signupError['city'],
                    ),
                    Obx(
                      () => CustomTextField(
                        isPassword: RxBool(false),
                        label: 'State',
                        showAsterisk: true,
                        readOnly: true,
                        controller: stateController,
                        hintStyle: txtInterTextFieldHint,
                        // inputType: TextInputType.number,
                        hintText: '',
                        errorText: controller.signupError['state'],
                        showDropDownIcon: true,
                        onTap: () {
                          if (controller.states.isNotEmpty) {
                            Get.bottomSheet(Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gray,
                                    blurRadius: 20,
                                  )
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            isDense: true,
                                            hintText: 'Search',
                                          ),
                                          onChanged: (value) {
                                            controller.searchState(value);
                                          },
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.clear))
                                    ],
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => ListView.builder(
                                        itemBuilder: (ctx, index) => ListTile(
                                          onTap: () {
                                            stateController.text = controller.searchedStates[index].name ?? '';
                                            controller.selectState.value = controller.searchedStates[index];
                                            controller.searchState('');
                                            Get.back();
                                          },
                                          title: Text(
                                            controller.searchedStates[index].name ?? '',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        itemCount: controller.searchedStates.length,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                          } else {
                            LogUtil.error('country empty');
                          }
                        },
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
                          if (controller.searchedCountries.isNotEmpty) {
                            Get.bottomSheet(Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gray,
                                    blurRadius: 20,
                                  )
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            isDense: true,
                                            hintText: 'Search',
                                          ),
                                          onChanged: (value) {
                                            controller.searchCountry(value);
                                          },
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.clear))
                                    ],
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => ListView.builder(
                                        itemBuilder: (ctx, index) => ListTile(
                                          onTap: () {
                                            countryController.text = controller.searchedCountries[index].name ?? '';
                                            controller.selectCountry.value = controller.searchedCountries[index];
                                            controller.getStates(controller.searchedCountries[index].id);
                                            controller.selectState.value = null;
                                            stateController.text = '';
                                            controller.searchCountry('');
                                            Get.back();
                                          },
                                          leading: Text(
                                            controller.searchedCountries[index].emoji ?? '',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          title: Text(
                                            controller.searchedCountries[index].name ?? '',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        itemCount: controller.searchedCountries.length,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                          } else {
                            LogUtil.error('country empty');
                          }
                        },
                      ),
                    ),
                    /*CustomCountryStateDropdown<CountryModel>(
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
                      errorText: controller.signupError['country'],
                    ),*/
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
                              postalCode: postCodeController.text,
                              state: stateController.text,
                              country: countryController.text);
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
}
