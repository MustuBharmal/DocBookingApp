import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';

part 'city_model.g.dart';

@freezed
class CityResponse with _$CityResponse {
  const factory CityResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') @Default([]) List<CityModel> data,
  }) = _CityResponse;

  factory CityResponse.fromJson(Map<String, Object?> json) =>
      _$CityResponseFromJson(json);
}

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'latitude') String? latitude,
    @JsonKey(name: 'longitude') String? longitude,
    @JsonKey(name: 'state_id') int? stateId,
    @JsonKey(name: 'state_code') String? stateCode,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, Object?> json) =>
      _$CityModelFromJson(json);
}
