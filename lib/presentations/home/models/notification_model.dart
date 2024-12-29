
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@freezed
class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data')  @Default([]) List<NotificationModel> data,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, Object?> json) => _$NotificationResponseFromJson(json);
}

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @Default(0) int id,
    String? type,
    String? title,
    String? message,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'is_read') String? isRead,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_deleted') bool? isDeleted,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,

  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json)
  => _$NotificationModelFromJson(json);
}