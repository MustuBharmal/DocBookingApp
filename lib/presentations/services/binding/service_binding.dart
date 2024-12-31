import 'package:doc_booking_app/presentations/services/controller/service_controller.dart';
import 'package:get/get.dart';

class ServiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ServicesController());
  }
}
