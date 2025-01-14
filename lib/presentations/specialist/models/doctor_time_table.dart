import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_time_table.freezed.dart';
part 'doctor_time_table.g.dart';
@freezed
class DoctorTimeTableResponse with _$DoctorTimeTableResponse {
  const factory DoctorTimeTableResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') @Default([]) List<DoctorTimeTable> data,
  }) = _DoctorTimeTableResponse;

  factory DoctorTimeTableResponse.fromJson(Map<String, Object?> json) =>
      _$DoctorTimeTableResponseFromJson(json);
}

@freezed
class DoctorTimeTable with _$DoctorTimeTable {
  const factory DoctorTimeTable({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'day') String? day,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'clinic_id') String? clinicId,
    @JsonKey(name: 'is_available') bool? isAvailable,
  }) = _DoctorTimeTable;

  factory DoctorTimeTable.fromJson(Map<String, Object?> json) => _$DoctorTimeTableFromJson(json);
}
// "id": 87,
// "start_time": "05:00",
// "end_time": "08:00",
// "day": "Wednesday",
// "doctor_id": "1",
// "type": "doctor",
// "clinic_id": null,
// "is_book_on": null,
// "is_book_available": false,
// "is_available": true
