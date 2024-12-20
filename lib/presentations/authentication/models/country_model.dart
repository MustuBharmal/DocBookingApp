import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryResponse with _$CountryResponse {
  const factory CountryResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') @Default([]) List<CountryModel> data,
  }) = _CountryResponse;

  /*
  "code": 200,
  "isLive": true,
  "status": "success",
  "message": "Country data successfully retrieved.",
*/

  factory CountryResponse.fromJson(Map<String, Object?> json) => _$CountryResponseFromJson(json);
}

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'iso3') String? iso3,
    @JsonKey(name: 'iso2') String? iso2,
    @JsonKey(name: 'phonecode') String? phoneCode,
    @JsonKey(name: 'emoji') String? emoji,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, Object?> json) => _$CountryModelFromJson(json);
}
