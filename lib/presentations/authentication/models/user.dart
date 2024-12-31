import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    String? name,
    String? email,
    String? phone,
    String? sex,
    String? dob,
    String? address,
    String? country,
    String? state,
    String? city,
    String? createdAt,
    String? updatedAt,
    String? latitude,
    String? longitude,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'pin_code') String? pinCode,
    @JsonKey(name: 'profile_pic') String? profilePic,
    @JsonKey(name: 'is_verified') String? isVerified,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
