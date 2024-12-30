import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_response.freezed.dart';
part 'booking_response.g.dart';

@freezed
class BookingResponse with _$BookingResponse {
  const factory BookingResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data')  BookingData? data,
  }) = _BookingResponse;

  factory BookingResponse.fromJson(Map<String, Object?> json) => _$BookingResponseFromJson(json);
}

@freezed
class BookingData with _$BookingData {
  const factory BookingData({
    @JsonKey(name: 'stripe_customer_id') String? stripeCustomerId,
    @JsonKey(name: 'payment_intent_client_secret') String? paymentIntentClientSecret,
    @JsonKey(name: 'payment_intent_data') Map<String, dynamic>? paymentIntentData,
    @JsonKey(name: 'ephemeral_key_data') Map<String, dynamic>? ephemeralKey,
    @JsonKey(name: 'booking_id') int? booking_id,
    @JsonKey(name: 'booking_code') String? booking_code,
    @JsonKey(name: 'amount') String? amount,
  }) = _BookingData;

  factory BookingData.fromJson(Map<String, Object?> json) => _$BookingDataFromJson(json);
}
/*

const Map<String, dynamic> response = {
  "stripe_customer_id": "cus_RTUn8vjciLtD0z",
  "payment_intent_client_secret": "pi_3QbHe7JAdLfZdFr60b159AKy_secret_omParvEzc90cWd8PV5B16GbTU",
  "payment_intent_data": {
    "id": "pi_3QbHe7JAdLfZdFr60b159AKy",
    "object": "payment_intent",
    "amount": 100,
    "amount_capturable": 0,
    "amount_details": {"tip": {}},
    "amount_received": 0,
    "application": null,
    "application_fee_amount": null,
    "automatic_payment_methods": null,
    "canceled_at": null,
    "cancellation_reason": null,
    "capture_method": "automatic_async",
    "client_secret": "pi_3QbHe7JAdLfZdFr60b159AKy_secret_omParvEzc90cWd8PV5B16GbTU",
    "confirmation_method": "automatic",
    "created": 1735460087,
    "currency": "usd",
    "customer": null,
    "description": null,
    "invoice": null,
    "last_payment_error": null,
    "latest_charge": null,
    "livemode": false,
    "metadata": {},
    "next_action": null,
    "on_behalf_of": null,
    "payment_method": null,
    "payment_method_configuration_details": null,
    "payment_method_options": {
      "card": {"installments": null, "mandate_options": null, "network": null, "request_three_d_secure": "automatic"}
    },
    "payment_method_types": ["card"],
    "processing": null,
    "receipt_email": null,
    "review": null,
    "setup_future_usage": null,
    "shipping": null,
    "source": null,
    "statement_descriptor": "Custom descriptor",
    "statement_descriptor_suffix": null,
    "status": "requires_payment_method",
    "transfer_data": null,
    "transfer_group": null
  },
  "ephemeralKey": {
    "id": "ephkey_1QbHe8JAdLfZdFr6ZDZV7hZe",
    "object": "ephemeral_key",
    "associated_objects": [
      {"id": "cus_RTUn8vjciLtD0z", "type": "customer"}
    ],
    "created": 1735460088,
    "expires": 1735463688,
    "livemode": false,
    "secret": "ek_test_YWNjdF8xSUczY05KQWRMZlpkRnI2LDVHOFExbjNEdjB3blJINXlscktoZE5MRG56TzN0dG0_00Prsx39q5"
  },
  "booking_id": 6,
  "booking_code": "BOOK-386201-1735460087603",
  "amount": "100"
};
*/
