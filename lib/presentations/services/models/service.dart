
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'service.freezed.dart';

part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required String icon,
    required int id,
    required String name,
    @JsonKey(name: 'is_active')required bool isActive,
    required String createdAt,
    required String updatedAt

  }) = _Service;

  factory Service.fromJson(Map<String, Object?> json)
  => _$ServiceFromJson(json);
}