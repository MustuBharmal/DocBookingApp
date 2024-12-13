import 'package:doc_booking_app/global/images.dart';

import '../presentations/profile/view/about_us_screen.dart';
import '../presentations/profile/view/contact_us_screen.dart';
import '../presentations/profile/view/faq_screen.dart';
import '../presentations/profile/view/how_to_be_partner_screen.dart';
import '../presentations/profile/view/payment_management_screen.dart';
import '../presentations/profile/view/prescription_screen.dart';
import '../presentations/profile/view/user_info_screen.dart';
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
  static var imagePathDetailList = [
    AppImage.userMyProfile,
    AppImage.paymentCard,
    AppImage.faq,
    AppImage.contactUs,
    AppImage.aboutUs,
    AppImage.profile2User,
    AppImage.prescription
  ];
  static const navigateDetailList = [
    UserInfoScreen.routeName,
    PaymentManagementScreen.routeName,
    FAQScreen.routeName,
    ContactUsScreen.routeName,
    AboutUsScreen.routeName,
    HowToBePartnerScreen.routeName,
    PrescriptionScreen.routeName,
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
