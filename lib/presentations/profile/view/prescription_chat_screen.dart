import 'package:doc_booking_app/global/styles.dart';
import 'package:doc_booking_app/presentations/profile/controller/prescription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/app_color.dart';

class PrescriptionChatScreen extends GetView<PrescriptionController> {
  static const String routeName = '/prescription-chat-screen';

  const PrescriptionChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: controller.messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final isUserMessage = controller.messages[index].sentBy == 'patient'; // Alternate alignment
                return Align(
                  alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage ? AppColors.primary.withOpacity(0.1) : AppColors.primary.withOpacity(0.1),
                      border: Border.all(color: isUserMessage ? AppColors.primary : AppColors.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      controller.messages[index].message ?? '',
                      style: TextStyle(
                        color: isUserMessage ? AppColors.primary : AppColors.primary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(border: Border.all(color: AppColors.borderColor), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.chatController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: 'Type your message', hintStyle: txtInterTextFieldHint, border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: AppColors.primary),
                  onPressed: () {
                    // Send the message through the ProfileController
                    final message = controller.chatController.text.trim();
                    if (message.isNotEmpty) {
                      controller.sendMessage(message);
                      controller.chatController.clear();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
