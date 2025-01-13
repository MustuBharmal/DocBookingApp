import 'package:doc_booking_app/presentations/services/models/service.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/presentations/specialist/models/specialist.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    @JsonKey(name: 'about-us') String? aboutUs,
    @JsonKey(name: 'privacy-policy') String? privacyPolicy,
    @JsonKey(name: 'teams-condition') String? teamsCondition,
    @JsonKey(name: 'upcoming_appointments') @Default([]) List<UpcomingAppointmentsData> upcomingAppointments,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, Object?> json) => _$DashboardFromJson(json);
}

@freezed
class UpcomingAppointmentsData with _$UpcomingAppointmentsData {
  const factory UpcomingAppointmentsData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'patient_id') int? patientId,
    @JsonKey(name: 'doctor_id') int? doctorId,
    @JsonKey(name: 'clinic_id') int? clinicId,
    @JsonKey(name: 'amount') double? amount,
    @JsonKey(name: 'booking_code') String? bookingCode,
    @JsonKey(name: 'booking_date_time') String? bookingDateTime,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'is_payment_done') bool? isPaymentDone,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'doctorData') AppointmentDoctorsList? doctorData,
    @JsonKey(name: 'patientData') PatientData? patientData,
    @JsonKey(name: 'doctorTimeTableData') DoctorTimeTableData? doctorTimeTableData,
    @JsonKey(name: 'clinicData') AppointmentDoctorsList? clinicData,
    @JsonKey(name: 'type_data') String? typeData,
  }) = _UpcomingAppointmentsData;

  factory UpcomingAppointmentsData.fromJson(Map<String, Object?> json) => _$UpcomingAppointmentsDataFromJson(json);
}

@freezed
class PatientData with _$PatientData {
  const factory PatientData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
  }) = _PatientData;

  factory PatientData.fromJson(Map<String, Object?> json) => _$PatientDataFromJson(json);
}

@freezed
class DoctorTimeTableData with _$DoctorTimeTableData {
  const factory DoctorTimeTableData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _DoctorTimeTableData;

  factory DoctorTimeTableData.fromJson(Map<String, Object?> json) => _$DoctorTimeTableDataFromJson(json);
}

@freezed
class AppointmentDoctorsList with _$AppointmentDoctorsList {
  const factory AppointmentDoctorsList({
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
    @JsonKey(name: 'address_data') String? address,
    // @JsonKey(name: 'service_type') List<String>? serviceType,
    @JsonKey(name: 'serviceModelData') Service? serviceData,
    @JsonKey(name: 'specialistModelData') Specialist? specialistData,
    @JsonKey(name: 'doctorTimeTableData') @Default([]) List<DoctorTimeTable> doctorTimeTable,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _AppointmentDoctorsList;

  factory AppointmentDoctorsList.fromJson(Map<String, Object?> json) => _$AppointmentDoctorsListFromJson(json);
}

/*@freezed
class DoctorData with _$DoctorData {
  const factory DoctorData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
  }) = _DoctorData;

  factory DoctorData.fromJson(Map<String, Object?> json) => _$DoctorDataFromJson(json);
}@freezed
class ClinicData with _$ClinicData {
  const factory ClinicData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
  }) = _ClinicData;

  factory ClinicData.fromJson(Map<String, Object?> json) => _$ClinicDataFromJson(json);
}*/
/*

var data = {
  "id": 242,
  "patient_id": 51,
  "doctor_id": null,
  "clinic_id": 10,
  "amount": 3000,
  "booking_code": "BOOK-87911-1735918402207",
  "status": "pending",
  "is_payment_done": false,
  "createdAt": "2025-01-03T15:33:22.000Z",
  "doctorData": null,
  "patientData": {
    "id": 51,
    "name": "dev",
    "email": "dev@gmail.com"
  },
  "doctorTimeTableData": {
    "id": 60,
    "start_time": "03:00",
    "end_time": "05:00"
  },
  "clinicData": {
    "id": 10,
    "name": "Lane Marshall",
    "email": "xawom@mailinator.com"
  }
}
*/
