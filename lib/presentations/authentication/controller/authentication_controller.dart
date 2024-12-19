import 'dart:async';
import 'dart:io';
import 'package:doc_booking_app/presentations/authentication/controller/base_controller.dart';
import 'package:doc_booking_app/presentations/authentication/repo/auth_repo.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../exception/server_exception.dart';
import '../models/user.dart';

class AuthenticationController extends BaseController {
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
  Rxn<User> user = Rxn<User>();
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        isTimerActive.value = false;
        _timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is disposed
    super.onClose();
  }

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void isVisible() {
    isObscure.value = !isObscure.value;
  }

  Future<void> signup() async {
    Get.offAllNamed(SignupScreen.routeName);
  }

  Future<void> login() async {
    showLoader();
    try {
      user.value = await AuthRepo.signIn(emailController.text, passController.text);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {
      dismissLoader();
    }
  }

  RxInt timeLeft = 60.obs; // 1 minute timer
  RxBool isTimerActive = true.obs;

  late Timer _timer;
}
