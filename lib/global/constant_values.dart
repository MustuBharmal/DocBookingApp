import 'package:get/get.dart';
import 'constant_string.dart';
import 'images.dart';

class ConstantValue {
  static const textListForServices = [
    ConstantString.phlebotomy,
    ConstantString.vitaminIv,
    ConstantString.vitaminBooster,
    ConstantString.bloodletting,
    ConstantString.trtAdministration,
    ConstantString.fluShots,
  ];

  static List imagePathListForServices = [
    AppImage.phlebotomy,
    AppImage.vitaminIv,
    AppImage.vitaminBooster,
    AppImage.bloodletting,
    AppImage.trtAdministration,
    AppImage.flushots,
  ];

  static const textListForSpecialist = [
    ConstantString.doctor,
    ConstantString.nutritionalist,
    ConstantString.fitnessCoach,
    ConstantString.trtTreatment,
    ConstantString.hrtTreatment,
    ConstantString.mentalHealth,
  ];

  static List imagePathListForSpecialist = [
    AppImage.doctor,
    AppImage.nutritionalist,
    AppImage.fitnessCoach,
    AppImage.trtTreatment,
    AppImage.hrtTreatment,
    AppImage.mentalHealth,
  ];

  static double height = Get.height;
  static double width = Get.width;
}
