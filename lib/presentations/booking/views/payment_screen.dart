import 'package:doc_booking_app/global/app_color.dart';
import 'package:doc_booking_app/util/log_utils.dart';
import 'package:doc_booking_app/widgets/blue_button.dart';
import 'package:doc_booking_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = '/payment_screen';

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool paymentInitialised = false;
  final CardFormEditController cardController = CardFormEditController();
  CardFieldInputDetails? card;

  @override
  void initState() {
    super.initState();
    initStripe();
  }

  initStripe() async {
    // testing key:- Stripe.publishableKey ='pk_test_51Qd3YTKXQInmSPzPKO11uJ7TrRcg7n9HXDxZNPmh7M39w4MEQVYvSISYm6SBhNT1UvL0Egrg15iacLtNcAfXmjTC00tAAJ44pu';
    Stripe.publishableKey =
        'pk_test_51IG3cNJAdLfZdFr6WbUo1H26tJfV9Hjo9Fh8QYfwCasaoR1qoVH4dNU0YX7Lo2jjS1uCdZ1PpirQlEyumsKed99n00njVKEQhY';
    await Stripe.instance.applySettings();
    cardController.addListener(() => update());
    paymentInitialised = true;
    safeSetState(() {});
  }

  void update() {
    LogUtil.debug(card?.number);
    safeSetState(() {});
  }

  void safeSetState(VoidCallback callback) {
    if (context.mounted) {
      setState(() {
        callback();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Management',
        actions: [],
      ),
      bottomNavigationBar: cardController.details.complete ? BlueButton(label: 'Pay') : null,
      body: paymentInitialised
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                  child: CardFormField(
                    onCardChanged: (card) {
                      this.card = card;
                      update();
                    },
                    style: CardFormStyle(
                        borderColor: AppColors.primary,
                        backgroundColor: AppColors.white,
                        borderRadius: 15,
                        borderWidth: 1,
                        textColor: AppColors.black),
                    enablePostalCode: false,
                    controller: cardController,
                    // onCardChanged: (card) {
                    //   card = card;
                    // },
                  ),
                ),
                if (cardController.details.complete) BlueButton(label: 'Pay')
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    cardController.removeListener(update);
    cardController.dispose();
    super.dispose();
  }
}
