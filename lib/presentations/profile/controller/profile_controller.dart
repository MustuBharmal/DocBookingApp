// import 'package:country_picker/country_picker.dart';
import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/profile/models/faq_model.dart';
import 'package:doc_booking_app/presentations/profile/repo/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../exception/server_exception.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();
  RxBool isEditingProfile = RxBool(false);
  RxString imageUrl = RxString('');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  RxList<FaqModels?> listOfFaqs = RxList.empty();
  final List<String> stateList = ['Florida', 'New York', 'Los Angeles'];
  final List<String> sexOptions = ['Male', 'Female', 'Other'];
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
  RxString selectedState = RxString('New York');
  RxString selectedSex = RxString('Male');
  RxString selectedCountry = RxString('');
  RxString selectedCity = RxString('');

  // Function to pick an image
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageUrl.value = pickedImage
          .path; // Update the reactive variable with the new image path
    }
  }

  // Country state (default is US)
  // var selectedCountry = CountryParser.parseCountryCode('US').obs;

  // Phone number state
  RxString phoneNumber = RxString('');

  RxString prefCommMethod = RxString('Whatsapp');

  // prescription inside data

  final TextEditingController chatController = TextEditingController();
  final TextEditingController symptomsController = TextEditingController();
  final TextEditingController bloodGrpController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    initializeControllers();
    getFaq();
  }

  initializeControllers() {
    final user = AuthController.instance.user.value;
    nameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    dobController.text = user?.dob ?? '';
    addressController.text = user?.address ?? '';
    phoneController.text = user?.phone ?? '';
    selectedSex.value = user?.sex ?? '';
    selectedState.value = user?.state ?? '';
    selectedCity.value = user?.city ?? '';
    selectedCountry.value = user?.country ?? '';
  }

  RxList<String> messages = [
    'Please avoid junk food and sugar drinks. Keep yourself stress-free.',
    "Yes, I will try my best to avoid it, but sometimes it's so hard!"
  ].obs;

  // Add message to the list
  void addMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(message);
    }
  }

  // Update phone number
  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  // get faq
  void getFaq() async{
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
}
