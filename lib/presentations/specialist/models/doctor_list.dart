import 'package:doc_booking_app/presentations/services/models/service.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/presentations/specialist/models/specialist.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_list.freezed.dart';
part 'doctor_list.g.dart';

@freezed
class DoctorListResponse with _$DoctorListResponse {
  const factory DoctorListResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') @Default([]) List<DoctorsList> data,
  }) = _DoctorListResponse;

  factory DoctorListResponse.fromJson(Map<String, Object?> json) => _$DoctorListResponseFromJson(json);
}

@freezed
class DoctorsList with _$DoctorsList {
  const factory DoctorsList({
    @JsonKey(name: 'profile_pic') String? profilePic,
    int? id,
    String? name,
    String? email,
    String? specialization,
    String? services,
    String? fees,
    String? location,
    String? availability,
    String? about,
    String? latitude,
    String? longitude,
    @JsonKey(name: 'service_type') List<String>? serviceType,
    @JsonKey(name: 'serviceModelData') Service? serviceData,
    @JsonKey(name: 'specialistModelData') Specialist? specialistData,
    @JsonKey(name: 'doctorTimeTableData') @Default([]) List<DoctorTimeTable> doctorTimeTable,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _DoctorsList;

  factory DoctorsList.fromJson(Map<String, Object?> json) => _$DoctorsListFromJson(json);
}
