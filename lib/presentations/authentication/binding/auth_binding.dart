import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';
import 'package:get/get.dart';

import '../controller/otp_timer_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(LoaderController(), permanent: true);
  }
}
class OtpVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OTPTimerController());
  }
}