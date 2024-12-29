import 'package:doc_booking_app/presentations/home/controller/home_controller.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_inside_screen.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_prescription_container.dart';

class PrescriptionScreen extends GetView<ProfileController> {
  static const String routeName = '/prescription-screen';

  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Prescription',
        back: true,
        isNotificationVisible: false,
      ),
      body: ListView.builder(
        itemCount: HomeController.instance.doctorList.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        itemBuilder: (context, index) {
          final data = HomeController.instance.doctorList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomPrescriptionContainer(
              imageUrl: data.profilePic ?? '',
              name: data.name ?? '',
              specialist: data.specialistData?.name ?? '',
              // date: data['date']!,
              // time: data['time']!,
              onPressed: () {
                controller.initializeSocketConnection(data);
              },
            ),
          );
        },
      ),
    );
  }
}
