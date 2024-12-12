import '../util/images.dart';
import 'constant_string.dart';

class ConstantList {
  static const textListForServices = [
    ConstantString.phlebotomy,
    ConstantString.vitaminIv,
    ConstantString.vitaminBooster,
    ConstantString.bloodletting,
    ConstantString.trtAdministration,
    ConstantString.fluShots,
  ];

  static List imagePathListForServices = [
    Images.phlebotomy,
    Images.vitaminIv,
    Images.vitaminBooster,
    Images.bloodletting,
    Images.trtAdministration,
    Images.flushots,
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
    Images.doctor,
    Images.nutritionalist,
    Images.fitnessCoach,
    Images.trtTreatment,
    Images.hrtTreatment,
    Images.mentalHealth,
  ];
}
