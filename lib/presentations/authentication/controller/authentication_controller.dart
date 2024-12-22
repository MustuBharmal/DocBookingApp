import 'dart:async';
import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';
import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/state_model.dart';
import 'package:doc_booking_app/presentations/authentication/repo/auth_repo.dart';
import 'package:doc_booking_app/service/http_service.dart';
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
  Rx<String?> selectSex = Rx(null);

  // RxString selectState = RxString('state1');
  Rx<CountryModel?> selectCountry = Rx(null);
  Rx<StateModel?> selectState = Rx(null);
  RxBool isObscure = true.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<File?> selectedImageSignup = Rx<File?>(null);
  Rxn<User> user = Rxn<User>();
  final ImagePicker _picker = ImagePicker();
  String? email;
  final List<CountryModel> countries = [];
  final RxList<CountryModel> searchedCountries = RxList.empty();
  final List<StateModel> states = [];
  final RxList<StateModel> searchedStates = RxList.empty();
  Rx<CountryModel?> selectedCountrySingUp = Rx(null);
  RxMap<String, String> signupError = RxMap({});

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
    if (value.isNotEmpty) {
      searchedStates.clear();
      searchedStates
          .addAll(states.where((country) => country.name?.toLowerCase().startsWith(value.toLowerCase()) ?? false).toList());
    } else {
      searchedStates.clear();
      searchedStates.addAll(states);
    }
  }

  void searchCountry(String value) {
    if (value.isNotEmpty) {
      searchedCountries.clear();
      searchedCountries
          .addAll(countries.where((country) => country.name?.toLowerCase().startsWith(value.toLowerCase()) ?? false).toList());
    } else {
      searchedCountries.clear();
      searchedCountries.addAll(countries);
    }
  }

  getCountries() async {
    try {
      countries.clear();
      countries.addAll(await AuthRepo.getCountries());
      searchedCountries.clear();
      searchedCountries.addAll(countries);
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
      required String address,
      required String postalCode,
      required String sex,
      required String state,
      required String country}) async {
    try {
      signupError.clear();
      if (name.isEmpty) {
        signupError['name'] = 'Please enter name';
      }
      if (email.isEmpty) {
        signupError['email'] = 'Please enter email!';
      } else if (!email.isEmail) {
        signupError['email'] = 'Please enter valid email!';
      }
      if (phone.isEmpty) {
        signupError['phone'] = 'Please enter phone number!';
      }
      if (!phone.isPhoneNumber) {
        signupError['phone'] = 'Please enter valid phone number!';
      }
      if (password.isEmpty) {
        signupError['password'] = 'Please enter password!';
      }
      if (dob.isEmpty) {
        signupError['dob'] = 'Please enter Date of birth!';
      }
      if (sex.isEmpty) {
        signupError['sex'] = 'Please select gender!';
      }
      if (state.isEmpty) {
        signupError['state'] = 'Please select state!';
      }
      if (country.isEmpty) {
        signupError['country'] = 'Please select country!';
      }
      if (postalCode.isEmpty) {
        signupError['city'] = 'Please enter Postal Code!';
      }
      if (address.isEmpty) {
        signupError['address'] = 'Please enter address!';
      }
      if (selectedImageSignup.value == null) {
        signupError['profile_pic'] = 'Please select image';
      }
      if (signupError.isNotEmpty) {
        return;
      } else {
        LoaderController.instance.showLoader();
        final String? profilePic = await AuthRepo.uploadProfilePic(selectedImageSignup.value!, showLoader: false);
        if (profilePic == null) {
          Get.snackbar('Error', 'Image Upload failed!');
          return;
        }
        user.value = await AuthRepo.signUp(
            name: name,
            email: email,
            dob: dob,
            phone: phone,
            address: address,
            sex: sex,
            state: state,
            city: postalCode,
            profilePic: profilePic,
            password: password,
            country: country,
            showLoader: false);
        LoaderController.instance.dismissLoader();
        if (user.value != null) {
          this.email = email;
          Get.toNamed(AccountVerificationScreen.routeName);
        }
      }
    } on CustomErrorMap catch (e) {
      signupError.clear();
      signupError.addAll(e.errors);
      LoaderController.instance.dismissLoader();
    } on ServerException catch (e) {
      LoaderController.instance.dismissLoader();
      Get.snackbar('Error', e.message);
    } on SocketException {
      LoaderController.instance.dismissLoader();
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      LoaderController.instance.dismissLoader();
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
