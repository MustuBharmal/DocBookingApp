import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_model.freezed.dart';
part 'state_model.g.dart';

@freezed
class StateResponse with _$StateResponse {
  const factory StateResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'isLive') @Default(false) bool success,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') @Default([]) List<StateModel> data,
  }) = _StateResponse;

  factory StateResponse.fromJson(Map<String, Object?> json) => _$StateResponseFromJson(json);
}

@freezed
class StateModel with _$StateModel {
  const factory StateModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'country_id') int? countryId,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'fips_code') String? fipsCode,
    @JsonKey(name: 'iso2') String? iso2,
  }) = _StateModel;

  factory StateModel.fromJson(Map<String, Object?> json) => _$StateModelFromJson(json);
}
