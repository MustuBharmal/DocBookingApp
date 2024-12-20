// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Specialist _$SpecialistFromJson(Map<String, dynamic> json) {
  return _Specialist.fromJson(json);
}

/// @nodoc
mixin _$Specialist {
  String? get icon => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Specialist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecialistCopyWith<Specialist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistCopyWith<$Res> {
  factory $SpecialistCopyWith(
          Specialist value, $Res Function(Specialist) then) =
      _$SpecialistCopyWithImpl<$Res, Specialist>;
  @useResult
  $Res call(
      {String? icon,
      int? id,
      String? name,
      @JsonKey(name: 'is_active') bool? isActive,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$SpecialistCopyWithImpl<$Res, $Val extends Specialist>
    implements $SpecialistCopyWith<$Res> {
  _$SpecialistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialistImplCopyWith<$Res>
    implements $SpecialistCopyWith<$Res> {
  factory _$$SpecialistImplCopyWith(
          _$SpecialistImpl value, $Res Function(_$SpecialistImpl) then) =
      __$$SpecialistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? icon,
      int? id,
      String? name,
      @JsonKey(name: 'is_active') bool? isActive,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$SpecialistImplCopyWithImpl<$Res>
    extends _$SpecialistCopyWithImpl<$Res, _$SpecialistImpl>
    implements _$$SpecialistImplCopyWith<$Res> {
  __$$SpecialistImplCopyWithImpl(
      _$SpecialistImpl _value, $Res Function(_$SpecialistImpl) _then)
      : super(_value, _then);

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SpecialistImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialistImpl with DiagnosticableTreeMixin implements _Specialist {
  const _$SpecialistImpl(
      {this.icon,
      this.id,
      this.name,
      @JsonKey(name: 'is_active') this.isActive,
      this.createdAt,
      this.updatedAt});

  factory _$SpecialistImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialistImplFromJson(json);

  @override
  final String? icon;
  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Specialist(icon: $icon, id: $id, name: $name, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Specialist'))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialistImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, icon, id, name, isActive, createdAt, updatedAt);

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialistImplCopyWith<_$SpecialistImpl> get copyWith =>
      __$$SpecialistImplCopyWithImpl<_$SpecialistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialistImplToJson(
      this,
    );
  }
}

abstract class _Specialist implements Specialist {
  const factory _Specialist(
      {final String? icon,
      final int? id,
      final String? name,
      @JsonKey(name: 'is_active') final bool? isActive,
      final String? createdAt,
      final String? updatedAt}) = _$SpecialistImpl;

  factory _Specialist.fromJson(Map<String, dynamic> json) =
      _$SpecialistImpl.fromJson;

  @override
  String? get icon;
  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecialistImplCopyWith<_$SpecialistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
