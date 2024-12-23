import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentManagementScreen extends StatelessWidget {
  static const String routeName = '/payment-management-screen';
  const PaymentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Management', back: true, isNotificationVisible: false,),
      body: Container(),
    );
  }
}
