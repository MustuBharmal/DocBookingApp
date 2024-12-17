import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/views/login_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance =>
      Get.find<AuthenticationController>();
  RxInt activeIndex = RxInt(0);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  RxString selectSex = RxString('Male');
  RxBool isObscure = true.obs;
  Rx<File?> selectedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  // Function to remove the selected image
  void removeImage() {
    selectedImage.value = null;
  }

  void isVisible() {
    isObscure.value = !isObscure.value;
  }

  Future<void> signup() async {
    Get.offAllNamed(SignupScreen.routeName);
  }

  Future<void> login() async {
    Get.offAllNamed(NavigationScreen.routeName);
  }
}
