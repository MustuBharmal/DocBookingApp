import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/profile/models/faq_model.dart';
import 'package:doc_booking_app/presentations/profile/repo/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../exception/server_exception.dart';
import '../../authentication/models/city_model.dart';
import '../../authentication/models/country_model.dart';
import '../../authentication/models/state_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();
  RxString imageUrl = RxString('');
  RxBool isEditingProfile = RxBool(false);
  RxMap<String, String> profileError = RxMap({});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController messageController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Rx<CountryModel?> selectCountry = Rx(null);
  Rx<StateModel?> selectState = Rx(null);
  Rx<CityModel?> selectCity = Rx(null);
  final ImagePicker _picker = ImagePicker();
  RxList<FaqModels?> listOfFaqs = RxList.empty();
  final List<String> prefCommMethodList = ['Whatsapp', 'Telephone', 'Message'];
  final List<String> businessNamesList = [
    'Fitness First',
    'Travelling',
    'Psychology'
  ];
  final List<String> businessTypesList = [
    'Clinic',
    'Hospital',
    'Small Hospital'
  ];
  RxString selectedBusinessName = RxString('Fitness First');
  RxString selectedBusinessType = RxString('Clinic');
  RxString selectedSex = RxString('');
  Rx<File?> selectedImage = Rx<File?>(null);

  // Function to pick an image
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // Phone number state
  RxString phoneNumber = RxString('');

  RxString prefCommMethod = RxString('Whatsapp');

  @override
  onInit() {
    super.onInit();
    initializeControllers();
    selectedImage = Rx<File?>(null);
    getFaq();
  }

  initializeControllers() {
    final user = AuthController.instance.user.value;
    imageUrl.value = user?.profilePic ??
        'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1736121600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=K6IBc34oEZTfO2Fvozs1V5mOGqff6iQ2VdibX-AVW1PEa-NINVvXbtyW5GxTiM-QilLtF4umNkGK2I~ycyoL84ObJnkXqjSPG66CQxqe96IKYWBErFu5TyFkq8QbmKCBDTrbM5HGJjslognO0Zh4pqVrtsDaHVk0uNmXnBpDXJ0uPZTB~DXwEnhdGGQtbC6RAnSuSz87v5Xk80wePKvHneKP3q--U7rUvmY3oZ4-mi8K4uoVZ-3CVPpkVyx6ikPIkmQQStKqsjAgwUzzqEttW~apbi2TkvOP8rBmOralmwU8-bHRxltyYVxMRL9EuGHL2wJ9np7mcf34G1WgQKRing__';
    selectedSex.value = user!.sex!;

    nameController.text = user.name ?? '';
    emailController.text = user.email ?? '';
    dobController.text = user.dob ?? '';
    addressController.text = user.address ?? '';
    phoneController.text = user.phone ?? '';
    selectedSex.value = user.sex ?? '';
    cityController.text = user.city ?? '';
    countryController.text = user.country ?? '';
    stateController.text = user.state ?? '';
    pinCodeController.text = user.pinCode ?? '';
  }

  // Update phone number
  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  // get faq
  void getFaq() async {
    try {
      listOfFaqs.value = await ProfileRepo.getFaqs();
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  // contact us
  void contactUs(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.contactUsApi(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void updateProfile(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.updateProfileApi(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  bool userEditProfileValidation() {
    if (nameController.text.isEmpty) {
      profileError['name'] = 'Please enter name';
    }
    if (emailController.text.isEmpty) {
      profileError['email'] = 'Please enter email';
    }
    if (dobController.text.isEmpty) {
      profileError['dob'] = 'Please enter Date of birth!';
    }
    if (selectedSex.isEmpty) {
      profileError['sex'] = 'Please select gender!';
    }
    if (stateController.text.isEmpty) {
      profileError['state'] = 'Please select state!';
    }
    if (countryController.text.isEmpty) {
      profileError['country'] = 'Please select country!';
    }
    if (cityController.text.isEmpty) {
      profileError['city'] = 'Please select city!';
    }
    if (addressController.text.isEmpty) {
      profileError['address'] = 'Please enter address!';
    }
    if (pinCodeController.text.isEmpty) {
      profileError['pin_code'] = 'Please enter Postal Code!';
    }
    if (imageUrl.isEmpty) {
      profileError['profile_pic'] = 'Please select image';
    }
    return profileError.isEmpty;
  }

  bool contactUsValidation() {
    profileError.clear();
    if (nameController.text.isEmpty) {
      profileError['name'] = 'Please enter name';
    }
    if (emailController.text.isEmpty) {
      profileError['email'] = 'Please enter email';
    }
    if (phoneController.text.isEmpty) {
      profileError['phone'] = 'Please enter phone';
    }
    if (prefCommMethod.isEmpty) {
      profileError['communication_method'] = 'Please enter business_type';
    }
    if (messageController.text.isEmpty) {
      profileError['message'] = 'Please enter message';
    }
    return profileError.isEmpty;
  }

  // how to be a partner
  void howToBePartner(Map<String, dynamic> params) async {
    try {
      await ProfileRepo.howToBePartner(params);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  bool htbValidation() {
    profileError.clear();

    if (nameController.text.isEmpty) {
      profileError['name'] = 'Please enter name';
    }
    if (emailController.text.isEmpty) {
      profileError['email'] = 'Please enter email';
    }
    if (phoneController.text.isEmpty) {
      profileError['phone'] = 'Please enter phone';
    }
    if (businessNameController.text.isEmpty) {
      profileError['business_name'] = 'Please enter business name';
    }
    if (businessTypeController.text.isEmpty) {
      profileError['business_type'] = 'Please enter business type';
    }
    return profileError.isEmpty;
  }
}
