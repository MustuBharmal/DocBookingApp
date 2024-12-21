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
    controller.expanded = List.filled(controller.faqQuestions.length, false);
    return Scaffold(
      appBar: CustomAppBar(title: 'FAQ', back: true, isVisible: false,),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GetBuilder<ProfileController>(
          builder: (controller){
          return ListView.builder(
            itemCount: controller.faqQuestions.length,
            itemBuilder: (context, index) {
              return FAQItem(
                question: controller.faqQuestions[index],
                answer: controller.faqAnswers[index],
                isExpanded : controller.expanded[index],
                onTap: () => controller.toggleExpansion(index),
              );
            },
          );}
        ),
      ),
    );
  }
}
