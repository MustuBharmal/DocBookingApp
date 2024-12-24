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
      services: json['services'] as String?,
      fees: json['fees'] as String?,
      location: json['location'] as String?,
      availability: json['availability'] as String?,
      about: json['about'] as String?,
      serviceData: json['serviceModelData'] == null
          ? null
          : Service.fromJson(json['serviceModelData'] as Map<String, dynamic>),
      specialistData: json['specialistModelData'] == null
          ? null
          : Specialist.fromJson(
              json['specialistModelData'] as Map<String, dynamic>),
      doctorTimeTable: (json['doctorTimeTableData'] as List<dynamic>?)
          ?.map((e) => DoctorTimeTable.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$DoctorsListImplToJson(_$DoctorsListImpl instance) =>
    <String, dynamic>{
      'profile_pic': instance.profilePic,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'specialization': instance.specialization,
      'services': instance.services,
      'fees': instance.fees,
      'location': instance.location,
      'availability': instance.availability,
      'about': instance.about,
      'serviceModelData': instance.serviceData,
      'specialistModelData': instance.specialistData,
      'doctorTimeTableData': instance.doctorTimeTable,
      'is_active': instance.isActive,
    };
