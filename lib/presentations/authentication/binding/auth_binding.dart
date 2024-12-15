import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController(), permanent: true);
  }
}
