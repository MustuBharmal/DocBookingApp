// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecialistImpl _$$SpecialistImplFromJson(Map<String, dynamic> json) =>
    _$SpecialistImpl(
      icon: json['icon'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$SpecialistImplToJson(_$SpecialistImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'id': instance.id,
      'name': instance.name,
      'is_active': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
