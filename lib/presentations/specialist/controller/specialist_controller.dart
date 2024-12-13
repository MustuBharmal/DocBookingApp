
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SpecialistController extends GetxController{
  static SpecialistController get instance=>Get.find<SpecialistController>();
  Rx<TextEditingController> searchController =TextEditingController().obs;
}