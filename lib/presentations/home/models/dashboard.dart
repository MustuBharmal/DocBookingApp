
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dashboard.freezed.dart';

part 'dashboard.g.dart';

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    @JsonKey(name: 'upcoming_appointments')List<Null>? upcomingAppointments,
    @JsonKey(name: 'about-us') String? aboutUs,
    @JsonKey(name: 'privacy-policy') String? privacyPolicy,
    @JsonKey(name: 'teams-condition') String? teamsCondition

  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, Object?> json)
  => _$DashboardFromJson(json);
}