import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsScreen extends GetView<ProfileController> {
  static const String routeName = '/contact-us-screen';
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    // CustomTextField(label: 'Full Name', showAsterisk: true, controller: controller)
  ],
),
    );
  }
}
