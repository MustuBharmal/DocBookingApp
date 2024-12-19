// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      profilePic: json['profilePic'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      sex: json['sex'] as String,
      dob: json['dob'] as String,
      address: json['address'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      is_verified: json['is_verified'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'profilePic': instance.profilePic,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'sex': instance.sex,
      'dob': instance.dob,
      'address': instance.address,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'is_verified': instance.is_verified,
    };
