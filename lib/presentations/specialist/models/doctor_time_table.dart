import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_time_table.freezed.dart';

part 'doctor_time_table.g.dart';

@freezed
class DoctorTimeTable with _$DoctorTimeTable {
  const factory DoctorTimeTable({
    int? id,
    String? day,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _DoctorTimeTable;

  factory DoctorTimeTable.fromJson(Map<String, Object?> json) =>
      _$DoctorTimeTableFromJson(json);
}
