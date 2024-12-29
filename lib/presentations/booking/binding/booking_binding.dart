import 'package:doc_booking_app/presentations/booking/controller/booking_controller.dart';
import 'package:get/get.dart';

class BookingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BookingController());
  }
}
