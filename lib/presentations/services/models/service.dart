
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'service.freezed.dart';

part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
     String? icon,
     int? id,
     String? name,
    @JsonKey(name: 'is_active') bool? isActive,
     String? createdAt,
     String? updatedAt

  }) = _Service;

  factory Service.fromJson(Map<String, Object?> json)
  => _$ServiceFromJson(json);
}