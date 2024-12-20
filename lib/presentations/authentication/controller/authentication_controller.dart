import 'dart:async';
import 'dart:io';

import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/repo/auth_repo.dart';
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
  RxString selectState = RxString('state1');
  RxString selectCountry = RxString('country1');
  RxBool isObscure = true.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  Rxn<User> user = Rxn<User>();
  final ImagePicker _picker = ImagePicker();
  String? email;
  RxList<CountryModel> countries = RxList.empty();
  Rx<CountryModel?> selectedCountrySingUp = Rx(null);

  @override
  void onInit() {
    super.onInit();
    // _startTimer();
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

  Future<void> signup() async {}

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

  Future<void> signUp(User user) async {
    try {
      AuthController.instance.user.value = await AuthRepo.signUp(user);
      Get.offAllNamed(AccountVerificationScreen.routeName);
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
    } finally {
      Get.offAllNamed(LoginWelcomeScreen.routeName);
    }
  }

  RxInt timeLeft = 60.obs; // 1 minute timer
  RxBool isTimerActive = true.obs;

  late Timer _timer;
}
