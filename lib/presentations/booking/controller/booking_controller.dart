import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';
import 'package:doc_booking_app/presentations/booking/models/booking_response.dart';
import 'package:doc_booking_app/presentations/booking/repo/booking_repo.dart';
import 'package:doc_booking_app/presentations/booking/views/book_slots_confirm_screen.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/util/custom_date_utils.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  static BookingController get instance => Get.find<BookingController>();
  DateTime today = CustomDateUtils.today;
  List<DateTime> thisWeek = CustomDateUtils.getNext7DaysRange();
  Rx<DateTime> selectedDate = Rx(CustomDateUtils.today);
  RxMap<DateTime, List<DoctorTimeTable>> timeTable = RxMap();
  Rx<DoctorTimeTable?> selectedTT = Rx(null);
  DoctorsList? doctorData;
  String? serviceType;

  void fillData(DoctorsList doctor, String type) async {
    doctorData = doctor;
    serviceType = type;
    if (doctorData != null) {
      for (var date in thisWeek) {
        timeTable[date] = doctorData!.doctorTimeTable.where((tt) {
          return tt.day?.toLowerCase() ==
              DateFormat('EEEE').format(date).toLowerCase();
        }).toList();
      }
    }
  }

  // @override
  // void onInit() {
  //
  //   super.onInit();
  //   Map<String, dynamic> data = {
  //     'services': Get.arguments['serviceId'],
  //   };
  //   // doctorList.clear();
  //   // doctorList.addAll(await ServicesRepo.getSpecifiedDoctors(data));
  //   // LogUtil.debug(doctorList.length);
  //   // searchDoctorList.clear();
  //   // searchDoctorList.addAll(doctorList);
  // }

  void confirmBooking() async {
    if (selectedTT.value != null) {
      Get.toNamed(BookSlotsConfirmScreen.routeName);
    }
  }

  pay() async {
    Stripe.publishableKey =
        'pk_test_51IG3cNJAdLfZdFr6WbUo1H26tJfV9Hjo9Fh8QYfwCasaoR1qoVH4dNU0YX7Lo2jjS1uCdZ1PpirQlEyumsKed99n00njVKEQhY';

    // testing key:- 'pk_test_51Qd3YTKXQInmSPzPKO11uJ7TrRcg7n9HXDxZNPmh7M39w4MEQVYvSISYm6SBhNT1UvL0Egrg15iacLtNcAfXmjTC00tAAJ44pu';
    await Stripe.instance.applySettings();
    try {
      // 1. create payment intent on the server
      LoaderController.instance.showLoader();
      final BookingData? bookingData = await BookingRepo.getPaymentSecret(
          AuthController.instance.user.value?.id.toString() ?? '',
          doctorData?.id?.toString() ?? '',
          selectedTT.value?.id?.toString() ?? '',
          doctorData?.fees?.toString() ?? '',
          doctorData?.type ?? '',
          '${selectedDate.value.toString()}T${selectedTT.value?.startTime ?? ''}');

      // 2. initialize the payment sheet
      if (bookingData?.paymentIntentClientSecret == null) {
        LoaderController.instance.dismissLoader();
        LogUtil.error('Payment intent not found');
        Get.snackbar('Error', 'Payment intent not found');
        return;
      }
      if (bookingData?.ephemeralKey?['secret'] == null) {
        LoaderController.instance.dismissLoader();
        LogUtil.error('Ephemeral Key not found');
        Get.snackbar('Error', 'Ephemeral Key not found');
        return;
      }
      if (bookingData?.stripeCustomerId == null) {
        LoaderController.instance.dismissLoader();
        LogUtil.error('Customer id not found');
        Get.snackbar('Error', 'Customer id not found');
        return;
      }
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: true,
          // Main params
          merchantDisplayName: 'Doctor app booking',
          paymentIntentClientSecret: bookingData?.paymentIntentClientSecret,
          // Customer keys
          customerEphemeralKeySecret: bookingData?.ephemeralKey?['secret'],
          customerId: bookingData?.stripeCustomerId,
          // Extra options
          /*applePay: const PaymentSheetApplePay(
            merchantCountryCode: 'US',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),*/
          style: ThemeMode.light,
        ),
      );
      final PaymentSheetPaymentOption? paymentResult =
          await Stripe.instance.presentPaymentSheet();
      if (paymentResult != null) {
        await Stripe.instance.confirmPaymentSheetPayment();
        await Future.delayed(Duration(seconds: 1));
        final bookingDetails = await BookingRepo.getBookingDetails(
            bookingData?.booking_id.toString() ?? '');
        LoaderController.instance.showLoader();
        if (bookingDetails?.isPaymentDone ?? false) {
          Get.snackbar('Success', 'Your booking done!');
        } else {
          Get.snackbar('Error', 'Your booking failed!');
        }

        HomeController.instance.selectedIndex.value = 0;
        HomeController.instance.dashboardData();
        Get.until(
            (routes) => routes.settings.name == NavigationScreen.routeName);
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
      LogUtil.error(e);
    }
  }
}
