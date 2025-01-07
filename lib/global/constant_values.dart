import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';

import '../presentations/home/view/home_screen.dart';
import '../presentations/profile/view/about_us_screen.dart';
import '../presentations/profile/view/contact_us_screen.dart';
import '../presentations/profile/view/faq_screen.dart';
import '../presentations/profile/view/how_to_be_partner_screen.dart';
import '../presentations/profile/view/payment_management_screen.dart';
import '../presentations/profile/view/prescription_screen.dart';
import '../presentations/profile/view/profile_screen.dart';
import '../presentations/profile/view/user_info_screen.dart';
import '../presentations/services/view/service_screen.dart';
import '../presentations/specialist/view/specialist_screen.dart';
import 'constant_string.dart';

class ConstantValue {
  static const detailList = [
    ConstantString.userInfo,
    ConstantString.paymentMng,
    ConstantString.faq,
    ConstantString.contactUs,
    ConstantString.aboutUs,
    ConstantString.howTobBePartner,
    ConstantString.prescription,
    ConstantString.logout,
  ];
  static var imagePathDetailList = [
    AppImage.userMyProfile,
    AppImage.paymentCard,
    AppImage.faq,
    AppImage.contactUs,
    AppImage.aboutUs,
    AppImage.profile2User,
    AppImage.prescription,
    AppImage.logout
  ];
  static const navigateDetailList = [
    UserInfoScreen.routeName,
    PaymentManagementScreen.routeName,
    FAQScreen.routeName,
    ContactUsScreen.routeName,
    AboutUsScreen.routeName,
    HowToBePartnerScreen.routeName,
    PrescriptionScreen.routeName,
    ProfileScreen.routeName,
  ];

  static final List<Widget> pages = const [
    HomeScreen(),
    ServiceScreen(),
    SpecialistScreen(),
    ProfileScreen(),
  ];
}
