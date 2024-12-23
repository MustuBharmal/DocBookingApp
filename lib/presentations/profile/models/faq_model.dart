import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModels with _$FaqModels {
  const factory FaqModels({
    @Default(0) int id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _FaqModels;

  factory FaqModels.fromJson(Map<String, Object?> json) => _$FaqModelsFromJson(json);
}
