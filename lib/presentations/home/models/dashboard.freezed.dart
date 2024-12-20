// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
// @JsonKey(name: 'upcoming_appointments')List<Null>? upcomingAppointments,
  @JsonKey(name: 'about-us')
  String? get aboutUs => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacy-policy')
  String? get privacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'teams-condition')
  String? get teamsCondition => throw _privateConstructorUsedError;

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {@JsonKey(name: 'about-us') String? aboutUs,
      @JsonKey(name: 'privacy-policy') String? privacyPolicy,
      @JsonKey(name: 'teams-condition') String? teamsCondition});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutUs = freezed,
    Object? privacyPolicy = freezed,
    Object? teamsCondition = freezed,
  }) {
    return _then(_value.copyWith(
      aboutUs: freezed == aboutUs
          ? _value.aboutUs
          : aboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicy: freezed == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      teamsCondition: freezed == teamsCondition
          ? _value.teamsCondition
          : teamsCondition // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'about-us') String? aboutUs,
      @JsonKey(name: 'privacy-policy') String? privacyPolicy,
      @JsonKey(name: 'teams-condition') String? teamsCondition});
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutUs = freezed,
    Object? privacyPolicy = freezed,
    Object? teamsCondition = freezed,
  }) {
    return _then(_$DashboardImpl(
      aboutUs: freezed == aboutUs
          ? _value.aboutUs
          : aboutUs // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyPolicy: freezed == privacyPolicy
          ? _value.privacyPolicy
          : privacyPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      teamsCondition: freezed == teamsCondition
          ? _value.teamsCondition
          : teamsCondition // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardImpl with DiagnosticableTreeMixin implements _Dashboard {
  const _$DashboardImpl(
      {@JsonKey(name: 'about-us') this.aboutUs,
      @JsonKey(name: 'privacy-policy') this.privacyPolicy,
      @JsonKey(name: 'teams-condition') this.teamsCondition});

  factory _$DashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardImplFromJson(json);

// @JsonKey(name: 'upcoming_appointments')List<Null>? upcomingAppointments,
  @override
  @JsonKey(name: 'about-us')
  final String? aboutUs;
  @override
  @JsonKey(name: 'privacy-policy')
  final String? privacyPolicy;
  @override
  @JsonKey(name: 'teams-condition')
  final String? teamsCondition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dashboard(aboutUs: $aboutUs, privacyPolicy: $privacyPolicy, teamsCondition: $teamsCondition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dashboard'))
      ..add(DiagnosticsProperty('aboutUs', aboutUs))
      ..add(DiagnosticsProperty('privacyPolicy', privacyPolicy))
      ..add(DiagnosticsProperty('teamsCondition', teamsCondition));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            (identical(other.aboutUs, aboutUs) || other.aboutUs == aboutUs) &&
            (identical(other.privacyPolicy, privacyPolicy) ||
                other.privacyPolicy == privacyPolicy) &&
            (identical(other.teamsCondition, teamsCondition) ||
                other.teamsCondition == teamsCondition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, aboutUs, privacyPolicy, teamsCondition);

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardImplToJson(
      this,
    );
  }
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(
          {@JsonKey(name: 'about-us') final String? aboutUs,
          @JsonKey(name: 'privacy-policy') final String? privacyPolicy,
          @JsonKey(name: 'teams-condition') final String? teamsCondition}) =
      _$DashboardImpl;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$DashboardImpl.fromJson;

// @JsonKey(name: 'upcoming_appointments')List<Null>? upcomingAppointments,
  @override
  @JsonKey(name: 'about-us')
  String? get aboutUs;
  @override
  @JsonKey(name: 'privacy-policy')
  String? get privacyPolicy;
  @override
  @JsonKey(name: 'teams-condition')
  String? get teamsCondition;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
