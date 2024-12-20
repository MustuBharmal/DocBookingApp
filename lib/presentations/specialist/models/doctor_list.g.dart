// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorsListImpl _$$DoctorsListImplFromJson(Map<String, dynamic> json) =>
    _$DoctorsListImpl(
      profilePic: json['profile_pic'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      specialization: json['specialization'] as String?,
      fees: json['fees'] as String?,
      availability: json['availability'] as String?,
      about: json['about'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$DoctorsListImplToJson(_$DoctorsListImpl instance) =>
    <String, dynamic>{
      'profile_pic': instance.profilePic,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'specialization': instance.specialization,
      'fees': instance.fees,
      'availability': instance.availability,
      'about': instance.about,
      'is_active': instance.isActive,
    };
