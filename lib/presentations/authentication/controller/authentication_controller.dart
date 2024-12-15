import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find<AuthenticationController>();
  RxInt activeIndex = RxInt(0);

  Future<void> signup() async {
    Get.toNamed(NavigationScreen.routeName);
  }

  Future<void> login() async {
    Get.toNamed(NavigationScreen.routeName);
  }
}
