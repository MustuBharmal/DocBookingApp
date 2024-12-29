import 'package:doc_booking_app/presentations/authentication/views/account_verification_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/forgot_password_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/login_welcome_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/onboarding_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/reset_password_screen.dart';
import 'package:doc_booking_app/presentations/authentication/views/signup_screen.dart';
import 'package:doc_booking_app/presentations/booking/binding/booking_binding.dart';
import 'package:doc_booking_app/presentations/booking/binding/payment_binding.dart';
import 'package:doc_booking_app/presentations/booking/controller/booking_controller.dart';
import 'package:doc_booking_app/presentations/booking/views/book_time_slot_screen.dart';
import 'package:doc_booking_app/presentations/booking/views/payment_screen.dart';
import 'package:doc_booking_app/presentations/home/binding/home_binding.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/about_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/contact_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/faq_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/how_to_be_partner_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/payment_management_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_form_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_inside_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/user_info_screen.dart';
import 'package:doc_booking_app/presentations/review/view/reviews_screen.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';
import 'package:get/get.dart';

import '../presentations/authentication/binding/otp_verification_binding.dart';
import '../presentations/booking/views/book_slots_confirm_screen.dart';
import '../presentations/home/view/notification_screen.dart';
import '../presentations/profile/binding/profile_binding.dart';
import '../presentations/profile/view/user_info_edit_screen.dart';
import '../presentations/specialist/binding/specialist_binding.dart';
import '../presentations/specialist/view/list_of_specialist_screen.dart';
import '../presentations/splash_screens/view/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(name: NavigationScreen.routeName, page: () => const NavigationScreen(), bindings: [
      HomeBinding(),
      SpecialistBinding(),
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
    GetPage(name: UserInfoScreen.routeName, page: () => const UserInfoScreen(), binding: ProfileBinding()),
    GetPage(
      name: BookSlotsConfirmScreen.routeName,
      page: () => const BookSlotsConfirmScreen(),
    ),
    GetPage(
      name: PaymentManagementScreen.routeName,
      page: () => const PaymentManagementScreen(),
    ),
    GetPage(name: FAQScreen.routeName, page: () => const FAQScreen(), binding: ProfileBinding()),
    GetPage(name: ContactUsScreen.routeName, page: () => const ContactUsScreen(), binding: ProfileBinding()),
    GetPage(
      name: AboutUsScreen.routeName,
      page: () => const AboutUsScreen(),
    ),
    GetPage(name: HowToBePartnerScreen.routeName, page: () => const HowToBePartnerScreen(), binding: ProfileBinding()),
    GetPage(
      name: PrescriptionScreen.routeName,
      page: () => PrescriptionScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PrescriptionInsideScreen.routeName,
      page: () => PrescriptionInsideScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PrescriptionFormScreen.routeName,
      page: () => PrescriptionFormScreen(),
      binding: ProfileBinding(),
    ),
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
    GetPage(
        name: ListOfSpecialistScreen.routeName,
        page: () {
          List<DoctorsList?> list = Get.arguments['doctorList'];
          return ListOfSpecialistScreen(doctorList: list);
        },
        binding: SpecialistBinding()),
    GetPage(
      name: SpecialistDetailScreen.routeName,
      page: () {
        DoctorsList doctor = Get.arguments;
        return SpecialistDetailScreen(doctor: doctor);
      },
    ),
    GetPage(
      name: PaymentScreen.routeName,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: NotificationScreen.routeName,
      page: () => NotificationScreen(),
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
      binding: OtpVerificationBinding(),
    ),
    GetPage(
        name: BookTimeSlotScreen.routeName,
        page: () {
          BookingController.instance.fillData(Get.arguments);
          return BookTimeSlotScreen();
        },
        binding: BookingBinding()),
    GetPage(
      name: UserInfoEditScreen.routeName,
      page: () => UserInfoEditScreen(),
    ),
    GetPage(
      name: ResetPasswordScreen.routeName,
      page: () => ResetPasswordScreen(),
    )
  ];
}
