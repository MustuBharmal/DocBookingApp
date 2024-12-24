import 'dart:async';
import 'dart:io';
import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/views/reset_password_screen.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../repo/auth_repo.dart';

class OTPVerificationController extends GetxController {
  var timerText = '1:00'.obs;
  late Timer _timer;
  int secondsRemaining = 60;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    secondsRemaining = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        timerText.value = formatTime(secondsRemaining);
      } else {
        timer.cancel();
        timerText.value = 'Resend';
      }
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void resetTimer() {
    _timer.cancel();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void verifyOtp(String email, String otp) async {
    try {
      AuthController.instance.user.value =
          await AuthRepo.otpVerification(email, otp);
      Get.offAllNamed(NavigationScreen.routeName);
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }

  void validateOtpPassword(String email, String otp) async {
    try {
      bool isVerified = await AuthRepo.validateOtpPassword(email, otp);
      if (isVerified) {
        Get.toNamed(ResetPasswordScreen.routeName);
      }
    } on ServerException catch (e) {
      Get.snackbar('Error', e.message);
    } on SocketException {
      Get.snackbar('Error', 'No internet connection');
    } catch (e) {
      Get.snackbar('Login failed', '$e');
    } finally {}
  }
}
