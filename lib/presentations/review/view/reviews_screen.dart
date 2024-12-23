import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  static const routeName = '/reviews-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Reviews", back: true, isNotificationVisible: false),
    );
  }
}
