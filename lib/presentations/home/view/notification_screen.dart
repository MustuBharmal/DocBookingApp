import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../global/app_color.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notification-screen';
  NotificationScreen({super.key});

  final List<NotificationItem> todayNotifications = [
    NotificationItem(
      title: "Dr. David Beckham has sent you a note.",
      timestamp: "30 seconds ago",
    ),
  ];

  final List<NotificationItem> olderNotifications = [
    NotificationItem(
      title: 'You have an appointment with Dr. Peater Parker for Wednesday 12th.',
      timestamp: '20 August',
    ),
    NotificationItem(
      title: 'Dr. Peater Parker has sent you a note.',
      timestamp: "14 July",
    ),
    NotificationItem(
      title: "Dr. Peater Parker wants you to complete the form.",
      timestamp: "10 June",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications',back: true,isNotificationVisible: false,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: 'Today',
              actionText: 'Mark all as read',
              onActionPressed: () {
                // Handle "Mark all as read"
              },
            ),
            ...todayNotifications.map((notification) => NotificationCard(notification: notification)),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Older',
              actionText: null,
            ),
            ...olderNotifications.map((notification) => NotificationCard(notification: notification)),
          ],
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
              fontFamily: 'Inter',
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionPressed,
              child: Text(
                actionText!,
                style:  TextStyle(
                  color: AppColors.grey,
                  fontSize: 13,
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
  final NotificationItem notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notification.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            notification.timestamp,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

// Notification Data Class
class NotificationItem {
  final String title;
  final String timestamp;

  NotificationItem({
    required this.title,
    required this.timestamp,
  });
}