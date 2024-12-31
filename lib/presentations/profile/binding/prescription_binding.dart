import 'package:doc_booking_app/presentations/profile/controller/prescription_controller.dart';
import 'package:get/get.dart';

class PrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrescriptionController());
  }
}
