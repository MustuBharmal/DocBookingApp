import 'dart:developer';

import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/booking/models/booking_response.dart';
import 'package:doc_booking_app/presentations/booking/repo/booking_repo.dart';
import 'package:doc_booking_app/presentations/booking/views/book_slots_confirm_screen.dart';
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

  void fillData(DoctorsList doctor) async {
    doctorData = doctor;
    if (doctorData != null) {
      for (var date in thisWeek) {
        timeTable[date] = doctorData!.doctorTimeTable.where((tt) {
          return tt.day?.toLowerCase() == DateFormat('EEEE').format(date).toLowerCase();
        }).toList();
      }
    }
  }

  void confirmBooking() async {
    if (selectedTT.value != null) {
      Get.toNamed(BookSlotsConfirmScreen.routeName);
    }
  }

  pay() async {
    Stripe.publishableKey =
        'pk_test_51IG3cNJAdLfZdFr6WbUo1H26tJfV9Hjo9Fh8QYfwCasaoR1qoVH4dNU0YX7Lo2jjS1uCdZ1PpirQlEyumsKed99n00njVKEQhY';
    await Stripe.instance.applySettings();
    try {
      // 1. create payment intent on the server
      final BookingData? bookingData = await BookingRepo.getPaymentSecret(AuthController.instance.user.value?.id.toString() ?? '',
          doctorData?.id?.toString() ?? '', selectedTT.value?.id?.toString() ?? '', doctorData?.fees?.toString() ?? '');

      // 2. initialize the payment sheet
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
      final PaymentSheetPaymentOption? paymentResult = await Stripe.instance.presentPaymentSheet();
      if (paymentResult != null) {
        LogUtil.debug(paymentResult.toJson());
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
      LogUtil.error(e);
    }
  }
}
