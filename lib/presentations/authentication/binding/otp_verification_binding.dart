import 'package:get/get.dart';

import '../controller/otp_timer_controller.dart';

class OtpVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OTPVerificationController());
  }
}