
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'specialist.freezed.dart';

part 'specialist.g.dart';

@freezed
class Specialist with _$Specialist {
  const factory Specialist({
    String? icon,
    int? id,
    String? name,
    @JsonKey(name: 'is_active') bool? isActive,
    String? createdAt,
    String? updatedAt

  }) = _Specialist;

  factory Specialist.fromJson(Map<String, Object?> json)
  => _$SpecialistFromJson(json);
}