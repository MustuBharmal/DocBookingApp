import 'package:doc_booking_app/presentations/authentication/controller/authentication_controller.dart';
import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../global/app_color.dart';
import '../../../global/styles.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../../../widgets/upcoming_appointment_card.dart';
import '../models/dashboard.dart';

class BookingHistoryDetails extends StatelessWidget {
  static const routeName = '/booking-history_detail-screen';

  final UpcomingAppointmentsData appointmentData;

  const BookingHistoryDetails({required this.appointmentData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Book Appointment', back: true, isNotificationVisible: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                UpcomingAppointmentCard(appointmentData: appointmentData),
                const SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'More Info',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter'),
                      ),
                      const SizedBox(height: 20),
                      AppointmentDetails(
                        patientName:
                            AuthController.instance.user.value?.name ?? '',
                        location:
                            AuthController.instance.user.value?.address ?? '',
                        totalAmount: '\$ ${appointmentData.amount}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomOutlinedButton(
              onPressed: () {
                HomeController.instance.cancelBooking(appointmentData.id ?? 0);
              },
              label: 'Cancel',
            ),
            // Column(
            //   children: [
            //     BlueButton(
            //       onPressed: () {},
            //       label: 'Reschedule',
            //     ),
            //     const SizedBox(height: 12),
            //     CustomOutlinedButton(
            //       onPressed: () {
            //         HomeController.instance.cancelBooking(appointmentData.id ?? 0);
            //       },
            //       label: 'Cancel',
            //     ),
            //     const SizedBox(height: 40),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class AppointmentDetails extends StatelessWidget {
  final String patientName;
  final String location;
  final String totalAmount;

  const AppointmentDetails({
    required this.patientName,
    required this.location,
    required this.totalAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Patient Name', patientName),
        const SizedBox(height: 8),
        _buildDetailRow('Location', location),
        const SizedBox(height: 8),
        _buildDetailRow('Total Amount', totalAmount),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: txtInterTextFieldHint),
        Text(value,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.activeBorderColor)),
      ],
    );
  }
}
