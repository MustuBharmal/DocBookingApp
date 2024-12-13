import 'package:doc_booking_app/presentations/specialist/controller/specialist_controller.dart';
import 'package:get/get.dart';

class SpecialistBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SpecialistController());
  }
}
