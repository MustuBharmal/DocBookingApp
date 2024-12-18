import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_chat_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_form_screen.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionInsideScreen extends GetView<ProfileController> {
  static const String routeName = '/prescription-inside-screen';

  const PrescriptionInsideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Prescription',
          back: true,
          isVisible: false,
        ),
        body: Column(
          children: [
            const CustomTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  PrescriptionChatScreen(), // Chat Screen
                  PrescriptionFormScreen(), // Form Screen
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Material(
        color: Colors.transparent,
        elevation: 0, // Remove shadow
        child: TabBar(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          //for Remove background color when tap on button
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          indicatorColor: Colors.transparent,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,

          tabs: const [
            Tab(
              child: Text(
                "Notes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                "Forms",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
