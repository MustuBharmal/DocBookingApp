import 'package:doc_booking_app/global/images.dart';

import 'constant_string.dart';

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
  static const detailList = [
    ConstantString.userInfo,
    ConstantString.paymentMng,
    ConstantString.faq,
    ConstantString.contactUs,
    ConstantString.aboutUs,
    ConstantString.howTobBePartner,
    ConstantString.prescription
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
}
