import 'package:doc_booking_app/presentations/booking/controller/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
  }
}
