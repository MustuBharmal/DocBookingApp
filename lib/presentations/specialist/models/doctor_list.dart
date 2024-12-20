
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
    String? fees,
    String? availability,
    String? about,
    @JsonKey(name: 'is_active') bool? isActive,

  }) = _DoctorsList;

  factory DoctorsList.fromJson(Map<String, Object?> json)
  => _$DoctorsListFromJson(json);
}