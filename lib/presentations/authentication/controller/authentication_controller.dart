import 'dart:async';
import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/state_model.dart';
import 'package:doc_booking_app/presentations/authentication/repo/auth_repo.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../exception/server_exception.dart';
import '../../home/view/navigation_screen.dart';
import '../models/user.dart';
import '../views/account_verification_screen.dart';
import '../views/login_welcome_screen.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>();
  RxInt activeIndex = RxInt(0);
  RxString selectSex = RxString('Male');

  // RxString selectState = RxString('state1');
  Rx<CountryModel?> selectCountry = Rx(null);
  Rx<StateModel?> selectState = Rx(null);
  RxBool isObscure = true.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<File?> selectedImageSignup = Rx<File?>(null);
  Rxn<User> user = Rxn<User>();
  final ImagePicker _picker = ImagePicker();
  String? email;
  final RxList<CountryModel> countries = RxList.empty();
  final RxList<StateModel> states = RxList.empty();
  final RxList<StateModel> searchedStates = RxList.empty();
  Rx<CountryModel?> selectedCountrySingUp = Rx(null);

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
  void onInit() {
    super.onInit();
    getCountries();
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

  void searchState(String value) {
    searchedStates.clear();
    searchedStates
        .addAll(states.where((country) => country.name?.toLowerCase().startsWith(value.toLowerCase()) ?? false).toList());
  }

  getCountries() async {
    try {
      countries.clear();
      countries.addAll(await AuthRepo.getCountries());
    } catch (e) {
      LogUtil.error(e.toString());
    }
  }

  getStates(int countryId) async {
    try {
      states.clear();
      states.addAll(await AuthRepo.getState(countryId.toString()));
      update(['state']);
      searchState('');
      LogUtil.debug(states.length);
    } catch (e) {
      LogUtil.error(e.toString());
    }
  }

  // Function to pick an image from the gallery
  Future<void> pickImageSignup() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImageSignup.value = File(image.path);
    }
  }

  void isVisible() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login(String email, String password) async {
    try {
      user.value = await AuthRepo.signIn(email, password);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String dob,
      required String sex,
      required String state,
      required String country}) async {
    try {
      if (name.isEmpty) {
        Get.snackbar('Error', 'Please enter name!');
        return;
      }
      if (email.isEmpty) {
        Get.snackbar('Error', 'Please enter email!');
        return;
      }
      if (!email.isEmail) {
        Get.snackbar('Error', 'Please enter valid email!');
        return;
      }
      if (phone.isEmpty) {
        Get.snackbar('Error', 'Please enter phone number!');
        return;
      }
      if (!phone.isPhoneNumber) {
        Get.snackbar('Error', 'Please enter valid phone number!');
        return;
      }
      if (password.isEmpty) {
        Get.snackbar('Error', 'Please enter password!');
        return;
      }
      if (dob.isEmpty) {
        Get.snackbar('Error', 'Please enter Date of birth!');
        return;
      }
      if (sex.isEmpty) {
        Get.snackbar('Error', 'Please select gender!');
        return;
      }
      if (state.isEmpty) {
        Get.snackbar('Error', 'Please select state!');
        return;
      }
      if (country.isEmpty) {
        Get.snackbar('Error', 'Please select country!');
        return;
      }
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  Future<void> getUser() async {
    try {
      user.value = await AuthRepo.getUser();
      Get.offAllNamed(NavigationScreen.routeName);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
      Get.offAllNamed(LoginWelcomeScreen.routeName);
    } finally {}
  }

  Future<void> forgetPasswordEmail(String email) async {
    try {
      final isOtpSent = await AuthRepo.forgetPassword(email);
      if (isOtpSent) {
        Get.toNamed(AccountVerificationScreen.routeName);
      }
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  RxInt timeLeft = 60.obs; // 1 minute timer
  RxBool isTimerActive = true.obs;

  late Timer _timer;
}
