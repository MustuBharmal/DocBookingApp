import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find<PaymentController>();
  Rx<CardFieldInputDetails?> card = Rx(null);
  RxBool paymentInitialised = RxBool(false);
  final CardFormEditController cardController = CardFormEditController();

  @override
  void onInit() {
    super.onInit();
    initStripe();
  }

  initStripe() async {
    Stripe.publishableKey ='pk_test_51Qd3YTKXQInmSPzPKO11uJ7TrRcg7n9HXDxZNPmh7M39w4MEQVYvSISYm6SBhNT1UvL0Egrg15iacLtNcAfXmjTC00tAAJ44pu';

    // Stripe.publishableKey =
    //     'pk_test_51IG3cNJAdLfZdFr6WbUo1H26tJfV9Hjo9Fh8QYfwCasaoR1qoVH4dNU0YX7Lo2jjS1uCdZ1PpirQlEyumsKed99n00njVKEQhY';
    await Stripe.instance.applySettings();
    cardController.addListener(() => update());
    paymentInitialised(true);
  }

  @override
  void dispose() {
    cardController.removeListener(update);
    cardController.dispose();
    super.dispose();
  }
}
