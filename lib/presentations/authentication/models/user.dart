import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String profilePic,
    required int id,
    required String name,
    required String email,
    required String phone,
    required String sex,
    required String dob,
    required String address,
    required String country,
    required String state,
    required String city,
    required String createdAt,
    required String updatedAt,
    required String is_verified,

  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
  => _$UserFromJson(json);
}