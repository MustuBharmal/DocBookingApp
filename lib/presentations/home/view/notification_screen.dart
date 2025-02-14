import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../controller/home_controller.dart';
import '../models/notification_model.dart';
import '../../../widgets/custom_app_bar.dart';

class NotificationScreen extends GetView<HomeController> {
  static const String routeName = '/notification-screen';

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        back: true,
        isNotificationVisible: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                ()=> (controller.unreadNotifications.isEmpty &&
                        controller.readNotifications.isEmpty)
                    ? Center(
                        child: Text(
                          'No Notifications',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Obx(() => controller.unreadNotifications.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          title: 'Unread',
                          actionText: 'Mark All as Read',
                          onActionPressed: () {
                            controller.markAsReadNotification();
                          },
                        ),
                        ...controller.unreadNotifications
                            .map((notification) => NotificationCard(
                                  notification: notification,
                                  isUnread: true,
                                  controller: controller,
                                ))
                      ],
                    )
                  : const SizedBox.shrink()),
              const SizedBox(height: 16),
              Obx(() => controller.readNotifications.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(title: 'Older'),
                        ...controller.readNotifications
                            .map((notification) => NotificationCard(
                                  notification: notification,
                                  isUnread: false,
                                  controller: controller,
                                ))
                      ],
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionPressed,
              child: Text(
                actionText!,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel? notification;
  final bool isUnread;
  final HomeController controller;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.isUnread,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isUnread)
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: const Icon(Icons.circle, color: Colors.blue, size: 7),
          ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification!.message!,
                  style: (isUnread)
                      ? TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
                      : TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.timeAgo(notification!.createdAt!),
                  style: TextStyle(fontSize: 12, color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
