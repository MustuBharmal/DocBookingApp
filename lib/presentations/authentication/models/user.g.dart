// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      sex: json['sex'] as String?,
      dob: json['dob'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      password: json['password'] as String?,
      pinCode: json['pin_code'] as String?,
      profilePic: json['profile_pic'] as String?,
      isVerified: json['is_verified'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
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
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'password': instance.password,
      'pin_code': instance.pinCode,
      'profile_pic': instance.profilePic,
      'is_verified': instance.isVerified,
    };
