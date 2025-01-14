import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_specialist_container.dart';
import '../../home/view/booking_history_detail.dart';

class AppointmentList extends GetView<ProfileController> {
  static const String routeName = '/appointment-list-screen';

  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Appointments',
        back: true,
        isNotificationVisible: false,
      ),
      body: Obx(
        () => Container(
          padding: const EdgeInsets.all(16),
          child: controller.bookingList.value!.appointments.isEmpty
              ? Center(
                  child: Text('No Appointment available'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final appointmentData =
                        controller.bookingList.value?.appointments[index];
                    return CustomSpecialistContainer(
                      picPath: appointmentData?.doctorData?.profilePic ??
                          (appointmentData?.clinicData?.profilePic ?? ''),
                      name: appointmentData?.doctorData?.name ??
                          appointmentData?.clinicData?.name ??
                          '',
                      specialist:
                          appointmentData?.doctorData?.serviceData?.name ??
                              appointmentData?.clinicData?.serviceData?.name ??
                              '',
                      charges: '',
                      onPressed: () {
                        Get.toNamed(BookingHistoryDetails.routeName,
                            arguments: {
                              'bookingDetails': controller
                                  .bookingList.value?.appointments[index]
                            });
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount:
                      controller.bookingList.value?.appointments.length ?? 0,
                ),
        ),
      ),
    );
  }
}
