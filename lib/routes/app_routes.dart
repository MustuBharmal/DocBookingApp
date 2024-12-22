import 'package:doc_booking_app/presentations/authentication/views/account_verification_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/forgot_password_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_welcome_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/onboarding_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/presentations/home/binding/home_binding.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/about_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/contact_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/faq_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/how_to_be_partner_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/payment_management_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_inside_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/user_info_screen.dart';
import 'package:doc_booking_app/presentations/review/view/reviews_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';
import 'package:get/get.dart';

import '../presentations/authentication/binding/otp_verification_binding.dart';
import '../presentations/booking/views/book_slots_confirm_screen.dart';
import '../presentations/profile/binding/profile_binding.dart';
import '../presentations/specialist/binding/specialist_binding.dart';
import '../presentations/specialist/view/list_of_specialist_screen.dart';
import '../presentations/splash_screens/view/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
        name: NavigationScreen.routeName,
        page: () => const NavigationScreen(),
        bindings: [
          HomeBinding(),
          SpecialistBinding(),
          ProfileBinding(),
        ]),
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: OnboardingScreen.routeName,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: LoginWelcomeScreen.routeName,
      page: () => const LoginWelcomeScreen(),
    ),
    /* GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
        binding: HomeBinding()),*/
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: UserInfoScreen.routeName,
      page: () => const UserInfoScreen(),
    ),
    GetPage(
      name: BookSlotsConfirmScreen.routeName,
      page: () => const BookSlotsConfirmScreen(),
    ),
    GetPage(
      name: PaymentManagementScreen.routeName,
      page: () => const PaymentManagementScreen(),
    ),
    GetPage(
      name: FAQScreen.routeName,
      page: () => const FAQScreen(),
    ),
    GetPage(
      name: ContactUsScreen.routeName,
      page: () => const ContactUsScreen(),
    ),
    GetPage(
      name: AboutUsScreen.routeName,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: HowToBePartnerScreen.routeName,
      page: () => const HowToBePartnerScreen(),
    ),
    GetPage(
      name: PrescriptionScreen.routeName,
      page: () => PrescriptionScreen(),
    ),
    GetPage(
        name: PrescriptionInsideScreen.routeName,
        page: () => PrescriptionInsideScreen()),
    GetPage(
      name: SpecialistScreen.routeName,
      page: () => const SpecialistScreen(),
    ),
    GetPage(
      name: ServiceScreen.routeName,
      page: () => const ServiceScreen(),
    ),
    GetPage(
      name: ReviewsScreen.routeName,
      page: () => const ReviewsScreen(),
    ),
    /*GetPage(
      name: SpecialistDetailScreen.routeName,
      page: () => const SpecialistDetailScreen(),
    ),*/
    GetPage(
        name: ListOfSpecialistScreen.routeName,
        page: () => const ListOfSpecialistScreen(),
        binding: SpecialistBinding()),
    GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: SignupScreen.routeName,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
        name: AccountVerificationScreen.routeName,
        page: () => AccountVerificationScreen(),
        binding: OtpVerificationBinding())
  ];
}
