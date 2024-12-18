

import 'package:doc_booking_app/presentations/profile/view/prescription_inside_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_prescription_container.dart';
class PrescriptionScreen extends StatelessWidget {
  static const String routeName = '/prescription-screen';
  PrescriptionScreen({super.key});

  // Simulating API Response Data
  final List<Map<String, String>> prescriptionData = [
    {
      "name": "Peater Parker",
      "specialist": "Psychiatrist",
      "date": "October 10, 2024",
      "time": "10:30pm",
    },
    {
      "name": "Bruce Wayne",
      "specialist": "Neurologist",
      "date": "November 15, 2024",
      "time": "3:00pm",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: prescriptionData.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        itemBuilder: (context, index) {
          final data = prescriptionData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomPrescriptionContainer(
              name: data['name']!,
              specialist: data['specialist']!,
              date: data['date']!,
              time: data['time']!,
              onPressed: () {
                Get.toNamed(PrescriptionInsideScreen.routeName);
              },
            ),
          );
        },
      ),
    );
  }
}
