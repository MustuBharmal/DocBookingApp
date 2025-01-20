import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../home/models/dashboard.dart';

part 'booking_list.freezed.dart';
part 'booking_list.g.dart';

@freezed
class BookingListResponse with _$BookingListResponse {
  const factory BookingListResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') @Default([]) List<UpcomingAppointmentsData> appointments,
  }) = _BookingListResponse;

  factory BookingListResponse.fromJson(Map<String, Object?> json) => _$BookingListResponseFromJson(json);
}
