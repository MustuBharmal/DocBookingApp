import 'package:doc_booking_app/presentations/authentication/views/login_welcome_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/onboarding_screen.dart';
import 'package:doc_booking_app/presentations/home/binding/home_binding.dart';
import 'package:doc_booking_app/presentations/home/view/home_screen.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/about_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/contact_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/faq_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/how_to_be_partner_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/payment_management_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/user_info_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';
import 'package:get/get.dart';
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
        ]),
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(name: OnboardingScreen.routeName, page: () => OnboardingScreen()),
    GetPage(
        name: LoginWelcomeScreen.routeName,
        page: () => const LoginWelcomeScreen()),
    GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(name: ProfileScreen.routeName, page: () => ProfileScreen(),),
    GetPage(name: UserInfoScreen.routeName, page: () => UserInfoScreen(),),
    GetPage(name: PaymentManagementScreen.routeName, page: () => PaymentManagementScreen(),),
    GetPage(name: FAQScreen.routeName, page: () => FAQScreen(),),
    GetPage(name: ContactUsScreen.routeName, page: () => ContactUsScreen(),),
    GetPage(name: AboutUsScreen.routeName, page: () => AboutUsScreen(),),
    GetPage(name: HowToBePartnerScreen.routeName, page: () => HowToBePartnerScreen(),),
    GetPage(name: PrescriptionScreen.routeName, page: () => PrescriptionScreen(),),
    GetPage(name: SpecialistScreen.routeName, page: () => SpecialistScreen()),
    GetPage(name: ServiceScreen.routeName, page: () => const ServiceScreen()),
    GetPage(
        name: ListOfSpecialistScreen.routeName,
        page: () => const ListOfSpecialistScreen(),
        binding: SpecialistBinding()),
  ];
}
