import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_details_response.freezed.dart';
part 'booking_details_response.g.dart';

@freezed
class BookingDetailsResponse with _$BookingDetailsResponse {
  const factory BookingDetailsResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') BookingDetailsData? data,
  }) = _BookingDetailsResponse;

  factory BookingDetailsResponse.fromJson(Map<String, Object?> json) => _$BookingDetailsResponseFromJson(json);
}

@freezed
class BookingDetailsData with _$BookingDetailsData {
  const factory BookingDetailsData({
    @JsonKey(name: 'patient_id') int? patientId,
    @JsonKey(name: 'doctor_id') int? doctorId,
    @JsonKey(name: 'doctor_time_table_id') int? doctorTimeTableId,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'booking_code') String? bookingCode,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'stripe_customer_id') String? stripeCustomerId,
    @JsonKey(name: 'is_payment_done') @Default(false) bool isPaymentDone,
  }) = _BookingDetailsData;

  factory BookingDetailsData.fromJson(Map<String, Object?> json) => _$BookingDetailsDataFromJson(json);
}
