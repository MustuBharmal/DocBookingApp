import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/faq_item.dart';

class FAQScreen extends GetView<ProfileController> {
  static const String routeName = '/faq-screen';

  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'FAQ',
        back: true,
        isNotificationVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Obx(
          ()=> ListView.builder(
            itemCount: controller.listOfFaqs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: FAQItem(
                  question: controller.listOfFaqs[index]?.title ?? '',
                  answer: controller.listOfFaqs[index]?.description ?? '',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
