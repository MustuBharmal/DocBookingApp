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
import 'package:doc_booking_app/presentations/profile/binding/prescription_binding.dart';
import 'package:doc_booking_app/presentations/profile/view/about_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/contact_us_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/faq_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/how_to_be_partner_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/appointments_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_form_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_inside_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/profile_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/user_info_screen.dart';
import 'package:doc_booking_app/presentations/review/view/reviews_screen.dart';
import 'package:doc_booking_app/presentations/services/binding/service_binding.dart';
import 'package:doc_booking_app/presentations/services/view/list_services_doctor.dart';
import 'package:doc_booking_app/presentations/services/view/service_screen.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_detail_screen.dart';
import 'package:doc_booking_app/presentations/specialist/view/specialist_screen.dart';
import 'package:get/get.dart';

import '../presentations/authentication/binding/otp_verification_binding.dart';
import '../presentations/booking/views/book_slots_confirm_screen.dart';
import '../presentations/home/models/dashboard.dart';
import '../presentations/home/view/booking_history_detail.dart';
import '../presentations/home/view/notification_screen.dart';
import '../presentations/profile/binding/profile_binding.dart';
import '../presentations/profile/view/user_info_edit_screen.dart';
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
      ],
    ),
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
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
    ),
    GetPage(
        name: UserInfoScreen.routeName,
        page: () => const UserInfoScreen(),
        binding: ProfileBinding()),
    GetPage(
      name: BookSlotsConfirmScreen.routeName,
      page: () => const BookSlotsConfirmScreen(),
    ),
    GetPage(
        name: AppointmentList.routeName,
        page: () => const AppointmentList(),
        binding: ProfileBinding()),
    GetPage(
        name: FAQScreen.routeName,
        page: () => const FAQScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: ContactUsScreen.routeName,
        page: () => const ContactUsScreen(),
        binding: ProfileBinding()),
    GetPage(
      name: AboutUsScreen.routeName,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
        name: HowToBePartnerScreen.routeName,
        page: () => const HowToBePartnerScreen(),
        binding: ProfileBinding()),
    GetPage(
      name: PrescriptionScreen.routeName,
      page: () => PrescriptionScreen(),
      binding: PrescriptionBinding(),
    ),
    GetPage(
      name: PrescriptionInsideScreen.routeName,
      page: () => PrescriptionInsideScreen(),
      binding: PrescriptionBinding(),
    ),
    GetPage(
      name: PrescriptionFormScreen.routeName,
      page: () => PrescriptionFormScreen(),
      // binding: ProfileBinding(),
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
        int? specializationId = Get.arguments['specializationId'];
        return ListOfSpecialistScreen(
          doctorList: list,
          specializationId: specializationId,
        );
      },
      binding: SpecialistBinding(),
    ),
    GetPage(
      name: ListOfServicesDoctorScreen.routeName,
      page: () {
        List<DoctorsList?> list = Get.arguments['doctorList'];
        int serviceId = Get.arguments['serviceId'];
        return ListOfServicesDoctorScreen(
          doctorList: list,
          serviceId: serviceId,
        );
      },
      binding: ServiceBinding(),
    ),
    GetPage(
        name: SpecialistDetailScreen.routeName,
        page: () {
          DoctorsList doctor = Get.arguments['doctor'];
          String serviceType = Get.arguments['serviceType'];
          return SpecialistDetailScreen(
              doctor: doctor, serviceType: serviceType);
        },
        binding: SpecialistBinding()),
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
          BookingController.instance
              .fillData(Get.arguments['doctor'], Get.arguments['serviceType']);
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
    ),
    GetPage(
      name: BookingHistoryDetails.routeName,
      page: () {
        UpcomingAppointmentsData bookDetails = Get.arguments['bookingDetails'];

        bool isCancellable = Get.arguments['isCancellable'];
        return BookingHistoryDetails(
          appointmentData: bookDetails,
          isCancellable: isCancellable,
        );
      },
    )
  ];
}
