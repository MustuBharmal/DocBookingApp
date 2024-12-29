import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/app_color.dart';
import '../../../util/date_util.dart';
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
      body: Obx(() {
        // Fetch notifications from controller
        final todayNotifications = controller.todayNotifications;
        final olderNotifications = controller.olderNotifications;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Today Section
                if (todayNotifications.isNotEmpty) ...[
                  SectionHeader(
                    title: 'Today',
                    actionText: 'Mark all as read',
                    onActionPressed: () {
                      // Handle "Mark all as read"
                    },
                  ),
                  ...todayNotifications.map((notification) {
                    return NotificationCard(
                      notification: notification!,
                      timeAgo: DateUtil.timeAgo(notification.createdAt!),
                    );
                  }),
                ],

                // Older Section
                if (olderNotifications.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const SectionHeader(
                    title: 'Older',
                    actionText: null,
                  ),
                  ...olderNotifications.map((notification) {
                    return NotificationCard(
                      notification: notification!,
                      timeAgo: DateUtil.timeAgo(notification.createdAt!),
                    );
                  }),
                ],

                // No Notifications
                if (todayNotifications.isEmpty && olderNotifications.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        'No notifications available.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
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
              fontWeight: FontWeight.w600,
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
  final NotificationModel notification;
  final String timeAgo;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   notification.title ?? '',
          //   style: const TextStyle(
          //     fontSize: 15,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          // const SizedBox(height: 8),
          Text(
            notification.message ?? '',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            timeAgo,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}