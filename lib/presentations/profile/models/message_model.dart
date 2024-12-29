import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    @Default(0) int id,
    @JsonKey(name: 'message_id') String? messageId,
    String? message,
    @JsonKey(name: 'patient_id') String? patientId,
    @JsonKey(name: 'doctor_id') String? doctorId,
    @JsonKey(name: 'sent_by') String? sentBy,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'createdAt') String? createdAt,
    bool? status,
    String? updatedAt,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) => _$MessageModelFromJson(json);
}
//'{id: 70, message_id: 729209, message: hey, patient_id: 22, doctor_id: 1, status: true, sent_by: patient, is_delete: false, is_read: false, createdAt: 2024-12-29T11:07:59.000Z, updatedAt: 2024-12-29T11:07:59.000Z}'
