import 'package:doc_booking_app/presentations/services/models/service.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';
import 'package:doc_booking_app/presentations/specialist/models/specialist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'doctor_list.freezed.dart';

part 'doctor_list.g.dart';

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
    @JsonKey(name: 'serviceModelData') Service? serviceData,
    @JsonKey(name: 'specialistModelData') Specialist? specialistData,
    @JsonKey(name: 'doctorTimeTableData') List<DoctorTimeTable>? doctorTimeTable,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _DoctorsList;

  factory DoctorsList.fromJson(Map<String, Object?> json) =>
      _$DoctorsListFromJson(json);
}
