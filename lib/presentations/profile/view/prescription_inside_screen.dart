import 'package:doc_booking_app/presentations/profile/controller/prescription_controller.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_chat_screen.dart';
import 'package:doc_booking_app/presentations/profile/view/prescription_form_screen.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_tab_bar.dart';

class PrescriptionInsideScreen extends GetView<PrescriptionController> {
  static const String routeName = '/prescription-inside-screen';

  const PrescriptionInsideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.disconnectSocket();
        }
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Prescription',
            back: true,
            isNotificationVisible: false,
          ),
          body: Column(
            children: [
              CustomTabBar(
                tabText1: 'Notes',
                tabText2: 'Forms',
                onTap: (index) {},
              ),
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
      ),
    );
  }
}
