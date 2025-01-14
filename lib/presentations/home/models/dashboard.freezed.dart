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
  @JsonKey(name: 'about-us')
  String? get aboutUs => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacy-policy')
  String? get privacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'teams-condition')
  String? get teamsCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'upcoming_appointments')
  List<UpcomingAppointmentsData> get upcomingAppointments =>
      throw _privateConstructorUsedError;

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
      @JsonKey(name: 'teams-condition') String? teamsCondition,
      @JsonKey(name: 'upcoming_appointments')
      List<UpcomingAppointmentsData> upcomingAppointments});
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
    Object? upcomingAppointments = null,
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
      upcomingAppointments: null == upcomingAppointments
          ? _value.upcomingAppointments
          : upcomingAppointments // ignore: cast_nullable_to_non_nullable
              as List<UpcomingAppointmentsData>,
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
      @JsonKey(name: 'teams-condition') String? teamsCondition,
      @JsonKey(name: 'upcoming_appointments')
      List<UpcomingAppointmentsData> upcomingAppointments});
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
    Object? upcomingAppointments = null,
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
      upcomingAppointments: null == upcomingAppointments
          ? _value._upcomingAppointments
          : upcomingAppointments // ignore: cast_nullable_to_non_nullable
              as List<UpcomingAppointmentsData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardImpl with DiagnosticableTreeMixin implements _Dashboard {
  const _$DashboardImpl(
      {@JsonKey(name: 'about-us') this.aboutUs,
      @JsonKey(name: 'privacy-policy') this.privacyPolicy,
      @JsonKey(name: 'teams-condition') this.teamsCondition,
      @JsonKey(name: 'upcoming_appointments')
      final List<UpcomingAppointmentsData> upcomingAppointments = const []})
      : _upcomingAppointments = upcomingAppointments;

  factory _$DashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardImplFromJson(json);

  @override
  @JsonKey(name: 'about-us')
  final String? aboutUs;
  @override
  @JsonKey(name: 'privacy-policy')
  final String? privacyPolicy;
  @override
  @JsonKey(name: 'teams-condition')
  final String? teamsCondition;
  final List<UpcomingAppointmentsData> _upcomingAppointments;
  @override
  @JsonKey(name: 'upcoming_appointments')
  List<UpcomingAppointmentsData> get upcomingAppointments {
    if (_upcomingAppointments is EqualUnmodifiableListView)
      return _upcomingAppointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingAppointments);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dashboard(aboutUs: $aboutUs, privacyPolicy: $privacyPolicy, teamsCondition: $teamsCondition, upcomingAppointments: $upcomingAppointments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dashboard'))
      ..add(DiagnosticsProperty('aboutUs', aboutUs))
      ..add(DiagnosticsProperty('privacyPolicy', privacyPolicy))
      ..add(DiagnosticsProperty('teamsCondition', teamsCondition))
      ..add(DiagnosticsProperty('upcomingAppointments', upcomingAppointments));
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
                other.teamsCondition == teamsCondition) &&
            const DeepCollectionEquality()
                .equals(other._upcomingAppointments, _upcomingAppointments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      aboutUs,
      privacyPolicy,
      teamsCondition,
      const DeepCollectionEquality().hash(_upcomingAppointments));

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
          @JsonKey(name: 'teams-condition') final String? teamsCondition,
          @JsonKey(name: 'upcoming_appointments')
          final List<UpcomingAppointmentsData> upcomingAppointments}) =
      _$DashboardImpl;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$DashboardImpl.fromJson;

  @override
  @JsonKey(name: 'about-us')
  String? get aboutUs;
  @override
  @JsonKey(name: 'privacy-policy')
  String? get privacyPolicy;
  @override
  @JsonKey(name: 'teams-condition')
  String? get teamsCondition;
  @override
  @JsonKey(name: 'upcoming_appointments')
  List<UpcomingAppointmentsData> get upcomingAppointments;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpcomingAppointmentsData _$UpcomingAppointmentsDataFromJson(
    Map<String, dynamic> json) {
  return _UpcomingAppointmentsData.fromJson(json);
}

/// @nodoc
mixin _$UpcomingAppointmentsData {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id')
  int? get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_id')
  int? get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinic_id')
  int? get clinicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_code')
  String? get bookingCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_date_time')
  String? get bookingDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_payment_done')
  bool? get isPaymentDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctorData')
  AppointmentDoctorsList? get doctorData => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientData')
  PatientData? get patientData => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctorTimeTableData')
  DoctorTimeTableData? get doctorTimeTableData =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'clinicData')
  AppointmentDoctorsList? get clinicData => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_type')
  String? get typeData => throw _privateConstructorUsedError;

  /// Serializes this UpcomingAppointmentsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpcomingAppointmentsDataCopyWith<UpcomingAppointmentsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingAppointmentsDataCopyWith<$Res> {
  factory $UpcomingAppointmentsDataCopyWith(UpcomingAppointmentsData value,
          $Res Function(UpcomingAppointmentsData) then) =
      _$UpcomingAppointmentsDataCopyWithImpl<$Res, UpcomingAppointmentsData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'patient_id') int? patientId,
      @JsonKey(name: 'doctor_id') int? doctorId,
      @JsonKey(name: 'clinic_id') int? clinicId,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'booking_code') String? bookingCode,
      @JsonKey(name: 'booking_date_time') String? bookingDateTime,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'is_payment_done') bool? isPaymentDone,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'doctorData') AppointmentDoctorsList? doctorData,
      @JsonKey(name: 'patientData') PatientData? patientData,
      @JsonKey(name: 'doctorTimeTableData')
      DoctorTimeTableData? doctorTimeTableData,
      @JsonKey(name: 'clinicData') AppointmentDoctorsList? clinicData,
      @JsonKey(name: 'booking_type') String? typeData});

  $AppointmentDoctorsListCopyWith<$Res>? get doctorData;
  $PatientDataCopyWith<$Res>? get patientData;
  $DoctorTimeTableDataCopyWith<$Res>? get doctorTimeTableData;
  $AppointmentDoctorsListCopyWith<$Res>? get clinicData;
}

/// @nodoc
class _$UpcomingAppointmentsDataCopyWithImpl<$Res,
        $Val extends UpcomingAppointmentsData>
    implements $UpcomingAppointmentsDataCopyWith<$Res> {
  _$UpcomingAppointmentsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? amount = freezed,
    Object? bookingCode = freezed,
    Object? bookingDateTime = freezed,
    Object? status = freezed,
    Object? isPaymentDone = freezed,
    Object? createdAt = freezed,
    Object? doctorData = freezed,
    Object? patientData = freezed,
    Object? doctorTimeTableData = freezed,
    Object? clinicData = freezed,
    Object? typeData = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinicId: freezed == clinicId
          ? _value.clinicId
          : clinicId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      bookingCode: freezed == bookingCode
          ? _value.bookingCode
          : bookingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingDateTime: freezed == bookingDateTime
          ? _value.bookingDateTime
          : bookingDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaymentDone: freezed == isPaymentDone
          ? _value.isPaymentDone
          : isPaymentDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorData: freezed == doctorData
          ? _value.doctorData
          : doctorData // ignore: cast_nullable_to_non_nullable
              as AppointmentDoctorsList?,
      patientData: freezed == patientData
          ? _value.patientData
          : patientData // ignore: cast_nullable_to_non_nullable
              as PatientData?,
      doctorTimeTableData: freezed == doctorTimeTableData
          ? _value.doctorTimeTableData
          : doctorTimeTableData // ignore: cast_nullable_to_non_nullable
              as DoctorTimeTableData?,
      clinicData: freezed == clinicData
          ? _value.clinicData
          : clinicData // ignore: cast_nullable_to_non_nullable
              as AppointmentDoctorsList?,
      typeData: freezed == typeData
          ? _value.typeData
          : typeData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppointmentDoctorsListCopyWith<$Res>? get doctorData {
    if (_value.doctorData == null) {
      return null;
    }

    return $AppointmentDoctorsListCopyWith<$Res>(_value.doctorData!, (value) {
      return _then(_value.copyWith(doctorData: value) as $Val);
    });
  }

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientDataCopyWith<$Res>? get patientData {
    if (_value.patientData == null) {
      return null;
    }

    return $PatientDataCopyWith<$Res>(_value.patientData!, (value) {
      return _then(_value.copyWith(patientData: value) as $Val);
    });
  }

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorTimeTableDataCopyWith<$Res>? get doctorTimeTableData {
    if (_value.doctorTimeTableData == null) {
      return null;
    }

    return $DoctorTimeTableDataCopyWith<$Res>(_value.doctorTimeTableData!,
        (value) {
      return _then(_value.copyWith(doctorTimeTableData: value) as $Val);
    });
  }

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppointmentDoctorsListCopyWith<$Res>? get clinicData {
    if (_value.clinicData == null) {
      return null;
    }

    return $AppointmentDoctorsListCopyWith<$Res>(_value.clinicData!, (value) {
      return _then(_value.copyWith(clinicData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpcomingAppointmentsDataImplCopyWith<$Res>
    implements $UpcomingAppointmentsDataCopyWith<$Res> {
  factory _$$UpcomingAppointmentsDataImplCopyWith(
          _$UpcomingAppointmentsDataImpl value,
          $Res Function(_$UpcomingAppointmentsDataImpl) then) =
      __$$UpcomingAppointmentsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'patient_id') int? patientId,
      @JsonKey(name: 'doctor_id') int? doctorId,
      @JsonKey(name: 'clinic_id') int? clinicId,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'booking_code') String? bookingCode,
      @JsonKey(name: 'booking_date_time') String? bookingDateTime,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'is_payment_done') bool? isPaymentDone,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'doctorData') AppointmentDoctorsList? doctorData,
      @JsonKey(name: 'patientData') PatientData? patientData,
      @JsonKey(name: 'doctorTimeTableData')
      DoctorTimeTableData? doctorTimeTableData,
      @JsonKey(name: 'clinicData') AppointmentDoctorsList? clinicData,
      @JsonKey(name: 'booking_type') String? typeData});

  @override
  $AppointmentDoctorsListCopyWith<$Res>? get doctorData;
  @override
  $PatientDataCopyWith<$Res>? get patientData;
  @override
  $DoctorTimeTableDataCopyWith<$Res>? get doctorTimeTableData;
  @override
  $AppointmentDoctorsListCopyWith<$Res>? get clinicData;
}

/// @nodoc
class __$$UpcomingAppointmentsDataImplCopyWithImpl<$Res>
    extends _$UpcomingAppointmentsDataCopyWithImpl<$Res,
        _$UpcomingAppointmentsDataImpl>
    implements _$$UpcomingAppointmentsDataImplCopyWith<$Res> {
  __$$UpcomingAppointmentsDataImplCopyWithImpl(
      _$UpcomingAppointmentsDataImpl _value,
      $Res Function(_$UpcomingAppointmentsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? patientId = freezed,
    Object? doctorId = freezed,
    Object? clinicId = freezed,
    Object? amount = freezed,
    Object? bookingCode = freezed,
    Object? bookingDateTime = freezed,
    Object? status = freezed,
    Object? isPaymentDone = freezed,
    Object? createdAt = freezed,
    Object? doctorData = freezed,
    Object? patientData = freezed,
    Object? doctorTimeTableData = freezed,
    Object? clinicData = freezed,
    Object? typeData = freezed,
  }) {
    return _then(_$UpcomingAppointmentsDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      patientId: freezed == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as int?,
      clinicId: freezed == clinicId
          ? _value.clinicId
          : clinicId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      bookingCode: freezed == bookingCode
          ? _value.bookingCode
          : bookingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingDateTime: freezed == bookingDateTime
          ? _value.bookingDateTime
          : bookingDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaymentDone: freezed == isPaymentDone
          ? _value.isPaymentDone
          : isPaymentDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorData: freezed == doctorData
          ? _value.doctorData
          : doctorData // ignore: cast_nullable_to_non_nullable
              as AppointmentDoctorsList?,
      patientData: freezed == patientData
          ? _value.patientData
          : patientData // ignore: cast_nullable_to_non_nullable
              as PatientData?,
      doctorTimeTableData: freezed == doctorTimeTableData
          ? _value.doctorTimeTableData
          : doctorTimeTableData // ignore: cast_nullable_to_non_nullable
              as DoctorTimeTableData?,
      clinicData: freezed == clinicData
          ? _value.clinicData
          : clinicData // ignore: cast_nullable_to_non_nullable
              as AppointmentDoctorsList?,
      typeData: freezed == typeData
          ? _value.typeData
          : typeData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpcomingAppointmentsDataImpl
    with DiagnosticableTreeMixin
    implements _UpcomingAppointmentsData {
  const _$UpcomingAppointmentsDataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'patient_id') this.patientId,
      @JsonKey(name: 'doctor_id') this.doctorId,
      @JsonKey(name: 'clinic_id') this.clinicId,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'booking_code') this.bookingCode,
      @JsonKey(name: 'booking_date_time') this.bookingDateTime,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'is_payment_done') this.isPaymentDone,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'doctorData') this.doctorData,
      @JsonKey(name: 'patientData') this.patientData,
      @JsonKey(name: 'doctorTimeTableData') this.doctorTimeTableData,
      @JsonKey(name: 'clinicData') this.clinicData,
      @JsonKey(name: 'booking_type') this.typeData});

  factory _$UpcomingAppointmentsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpcomingAppointmentsDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'patient_id')
  final int? patientId;
  @override
  @JsonKey(name: 'doctor_id')
  final int? doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  final int? clinicId;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'booking_code')
  final String? bookingCode;
  @override
  @JsonKey(name: 'booking_date_time')
  final String? bookingDateTime;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'is_payment_done')
  final bool? isPaymentDone;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'doctorData')
  final AppointmentDoctorsList? doctorData;
  @override
  @JsonKey(name: 'patientData')
  final PatientData? patientData;
  @override
  @JsonKey(name: 'doctorTimeTableData')
  final DoctorTimeTableData? doctorTimeTableData;
  @override
  @JsonKey(name: 'clinicData')
  final AppointmentDoctorsList? clinicData;
  @override
  @JsonKey(name: 'booking_type')
  final String? typeData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UpcomingAppointmentsData(id: $id, patientId: $patientId, doctorId: $doctorId, clinicId: $clinicId, amount: $amount, bookingCode: $bookingCode, bookingDateTime: $bookingDateTime, status: $status, isPaymentDone: $isPaymentDone, createdAt: $createdAt, doctorData: $doctorData, patientData: $patientData, doctorTimeTableData: $doctorTimeTableData, clinicData: $clinicData, typeData: $typeData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UpcomingAppointmentsData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('patientId', patientId))
      ..add(DiagnosticsProperty('doctorId', doctorId))
      ..add(DiagnosticsProperty('clinicId', clinicId))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('bookingCode', bookingCode))
      ..add(DiagnosticsProperty('bookingDateTime', bookingDateTime))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('isPaymentDone', isPaymentDone))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('doctorData', doctorData))
      ..add(DiagnosticsProperty('patientData', patientData))
      ..add(DiagnosticsProperty('doctorTimeTableData', doctorTimeTableData))
      ..add(DiagnosticsProperty('clinicData', clinicData))
      ..add(DiagnosticsProperty('typeData', typeData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingAppointmentsDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.clinicId, clinicId) ||
                other.clinicId == clinicId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.bookingCode, bookingCode) ||
                other.bookingCode == bookingCode) &&
            (identical(other.bookingDateTime, bookingDateTime) ||
                other.bookingDateTime == bookingDateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPaymentDone, isPaymentDone) ||
                other.isPaymentDone == isPaymentDone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.doctorData, doctorData) ||
                other.doctorData == doctorData) &&
            (identical(other.patientData, patientData) ||
                other.patientData == patientData) &&
            (identical(other.doctorTimeTableData, doctorTimeTableData) ||
                other.doctorTimeTableData == doctorTimeTableData) &&
            (identical(other.clinicData, clinicData) ||
                other.clinicData == clinicData) &&
            (identical(other.typeData, typeData) ||
                other.typeData == typeData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      patientId,
      doctorId,
      clinicId,
      amount,
      bookingCode,
      bookingDateTime,
      status,
      isPaymentDone,
      createdAt,
      doctorData,
      patientData,
      doctorTimeTableData,
      clinicData,
      typeData);

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingAppointmentsDataImplCopyWith<_$UpcomingAppointmentsDataImpl>
      get copyWith => __$$UpcomingAppointmentsDataImplCopyWithImpl<
          _$UpcomingAppointmentsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpcomingAppointmentsDataImplToJson(
      this,
    );
  }
}

abstract class _UpcomingAppointmentsData implements UpcomingAppointmentsData {
  const factory _UpcomingAppointmentsData(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'patient_id') final int? patientId,
          @JsonKey(name: 'doctor_id') final int? doctorId,
          @JsonKey(name: 'clinic_id') final int? clinicId,
          @JsonKey(name: 'amount') final double? amount,
          @JsonKey(name: 'booking_code') final String? bookingCode,
          @JsonKey(name: 'booking_date_time') final String? bookingDateTime,
          @JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'is_payment_done') final bool? isPaymentDone,
          @JsonKey(name: 'createdAt') final String? createdAt,
          @JsonKey(name: 'doctorData') final AppointmentDoctorsList? doctorData,
          @JsonKey(name: 'patientData') final PatientData? patientData,
          @JsonKey(name: 'doctorTimeTableData')
          final DoctorTimeTableData? doctorTimeTableData,
          @JsonKey(name: 'clinicData') final AppointmentDoctorsList? clinicData,
          @JsonKey(name: 'booking_type') final String? typeData}) =
      _$UpcomingAppointmentsDataImpl;

  factory _UpcomingAppointmentsData.fromJson(Map<String, dynamic> json) =
      _$UpcomingAppointmentsDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'patient_id')
  int? get patientId;
  @override
  @JsonKey(name: 'doctor_id')
  int? get doctorId;
  @override
  @JsonKey(name: 'clinic_id')
  int? get clinicId;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'booking_code')
  String? get bookingCode;
  @override
  @JsonKey(name: 'booking_date_time')
  String? get bookingDateTime;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'is_payment_done')
  bool? get isPaymentDone;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'doctorData')
  AppointmentDoctorsList? get doctorData;
  @override
  @JsonKey(name: 'patientData')
  PatientData? get patientData;
  @override
  @JsonKey(name: 'doctorTimeTableData')
  DoctorTimeTableData? get doctorTimeTableData;
  @override
  @JsonKey(name: 'clinicData')
  AppointmentDoctorsList? get clinicData;
  @override
  @JsonKey(name: 'booking_type')
  String? get typeData;

  /// Create a copy of UpcomingAppointmentsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpcomingAppointmentsDataImplCopyWith<_$UpcomingAppointmentsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PatientData _$PatientDataFromJson(Map<String, dynamic> json) {
  return _PatientData.fromJson(json);
}

/// @nodoc
mixin _$PatientData {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this PatientData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDataCopyWith<PatientData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDataCopyWith<$Res> {
  factory $PatientDataCopyWith(
          PatientData value, $Res Function(PatientData) then) =
      _$PatientDataCopyWithImpl<$Res, PatientData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email});
}

/// @nodoc
class _$PatientDataCopyWithImpl<$Res, $Val extends PatientData>
    implements $PatientDataCopyWith<$Res> {
  _$PatientDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientDataImplCopyWith<$Res>
    implements $PatientDataCopyWith<$Res> {
  factory _$$PatientDataImplCopyWith(
          _$PatientDataImpl value, $Res Function(_$PatientDataImpl) then) =
      __$$PatientDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email});
}

/// @nodoc
class __$$PatientDataImplCopyWithImpl<$Res>
    extends _$PatientDataCopyWithImpl<$Res, _$PatientDataImpl>
    implements _$$PatientDataImplCopyWith<$Res> {
  __$$PatientDataImplCopyWithImpl(
      _$PatientDataImpl _value, $Res Function(_$PatientDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_$PatientDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDataImpl with DiagnosticableTreeMixin implements _PatientData {
  const _$PatientDataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'email') this.email});

  factory _$PatientDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PatientData(id: $id, name: $name, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PatientData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  /// Create a copy of PatientData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDataImplCopyWith<_$PatientDataImpl> get copyWith =>
      __$$PatientDataImplCopyWithImpl<_$PatientDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientDataImplToJson(
      this,
    );
  }
}

abstract class _PatientData implements PatientData {
  const factory _PatientData(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'email') final String? email}) = _$PatientDataImpl;

  factory _PatientData.fromJson(Map<String, dynamic> json) =
      _$PatientDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'email')
  String? get email;

  /// Create a copy of PatientData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDataImplCopyWith<_$PatientDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorTimeTableData _$DoctorTimeTableDataFromJson(Map<String, dynamic> json) {
  return _DoctorTimeTableData.fromJson(json);
}

/// @nodoc
mixin _$DoctorTimeTableData {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this DoctorTimeTableData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorTimeTableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorTimeTableDataCopyWith<DoctorTimeTableData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorTimeTableDataCopyWith<$Res> {
  factory $DoctorTimeTableDataCopyWith(
          DoctorTimeTableData value, $Res Function(DoctorTimeTableData) then) =
      _$DoctorTimeTableDataCopyWithImpl<$Res, DoctorTimeTableData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$DoctorTimeTableDataCopyWithImpl<$Res, $Val extends DoctorTimeTableData>
    implements $DoctorTimeTableDataCopyWith<$Res> {
  _$DoctorTimeTableDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorTimeTableData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorTimeTableDataImplCopyWith<$Res>
    implements $DoctorTimeTableDataCopyWith<$Res> {
  factory _$$DoctorTimeTableDataImplCopyWith(_$DoctorTimeTableDataImpl value,
          $Res Function(_$DoctorTimeTableDataImpl) then) =
      __$$DoctorTimeTableDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$$DoctorTimeTableDataImplCopyWithImpl<$Res>
    extends _$DoctorTimeTableDataCopyWithImpl<$Res, _$DoctorTimeTableDataImpl>
    implements _$$DoctorTimeTableDataImplCopyWith<$Res> {
  __$$DoctorTimeTableDataImplCopyWithImpl(_$DoctorTimeTableDataImpl _value,
      $Res Function(_$DoctorTimeTableDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorTimeTableData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$DoctorTimeTableDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorTimeTableDataImpl
    with DiagnosticableTreeMixin
    implements _DoctorTimeTableData {
  const _$DoctorTimeTableDataImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime});

  factory _$DoctorTimeTableDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorTimeTableDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoctorTimeTableData(id: $id, startTime: $startTime, endTime: $endTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoctorTimeTableData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorTimeTableDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, endTime);

  /// Create a copy of DoctorTimeTableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorTimeTableDataImplCopyWith<_$DoctorTimeTableDataImpl> get copyWith =>
      __$$DoctorTimeTableDataImplCopyWithImpl<_$DoctorTimeTableDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorTimeTableDataImplToJson(
      this,
    );
  }
}

abstract class _DoctorTimeTableData implements DoctorTimeTableData {
  const factory _DoctorTimeTableData(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime}) =
      _$DoctorTimeTableDataImpl;

  factory _DoctorTimeTableData.fromJson(Map<String, dynamic> json) =
      _$DoctorTimeTableDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of DoctorTimeTableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorTimeTableDataImplCopyWith<_$DoctorTimeTableDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentDoctorsList _$AppointmentDoctorsListFromJson(
    Map<String, dynamic> json) {
  return _AppointmentDoctorsList.fromJson(json);
}

/// @nodoc
mixin _$AppointmentDoctorsList {
  @JsonKey(name: 'profile_pic')
  String? get profilePic => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  String? get services => throw _privateConstructorUsedError;
  String? get fees => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get availability => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_data')
  String? get address =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'service_type') List<String>? serviceType,
  @JsonKey(name: 'serviceModelData')
  Service? get serviceData => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialistModelData')
  Specialist? get specialistData => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctorTimeTableData')
  List<DoctorTimeTable> get doctorTimeTable =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this AppointmentDoctorsList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentDoctorsListCopyWith<AppointmentDoctorsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDoctorsListCopyWith<$Res> {
  factory $AppointmentDoctorsListCopyWith(AppointmentDoctorsList value,
          $Res Function(AppointmentDoctorsList) then) =
      _$AppointmentDoctorsListCopyWithImpl<$Res, AppointmentDoctorsList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'profile_pic') String? profilePic,
      int? id,
      String? name,
      String? email,
      String? specialization,
      String? services,
      String? fees,
      String? location,
      String? availability,
      String? about,
      String? latitude,
      String? longitude,
      @JsonKey(name: 'address_data') String? address,
      @JsonKey(name: 'serviceModelData') Service? serviceData,
      @JsonKey(name: 'specialistModelData') Specialist? specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      List<DoctorTimeTable> doctorTimeTable,
      @JsonKey(name: 'is_active') bool? isActive});

  $ServiceCopyWith<$Res>? get serviceData;
  $SpecialistCopyWith<$Res>? get specialistData;
}

/// @nodoc
class _$AppointmentDoctorsListCopyWithImpl<$Res,
        $Val extends AppointmentDoctorsList>
    implements $AppointmentDoctorsListCopyWith<$Res> {
  _$AppointmentDoctorsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePic = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? specialization = freezed,
    Object? services = freezed,
    Object? fees = freezed,
    Object? location = freezed,
    Object? availability = freezed,
    Object? about = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? serviceData = freezed,
    Object? specialistData = freezed,
    Object? doctorTimeTable = null,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceData: freezed == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as Service?,
      specialistData: freezed == specialistData
          ? _value.specialistData
          : specialistData // ignore: cast_nullable_to_non_nullable
              as Specialist?,
      doctorTimeTable: null == doctorTimeTable
          ? _value.doctorTimeTable
          : doctorTimeTable // ignore: cast_nullable_to_non_nullable
              as List<DoctorTimeTable>,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServiceCopyWith<$Res>? get serviceData {
    if (_value.serviceData == null) {
      return null;
    }

    return $ServiceCopyWith<$Res>(_value.serviceData!, (value) {
      return _then(_value.copyWith(serviceData: value) as $Val);
    });
  }

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialistCopyWith<$Res>? get specialistData {
    if (_value.specialistData == null) {
      return null;
    }

    return $SpecialistCopyWith<$Res>(_value.specialistData!, (value) {
      return _then(_value.copyWith(specialistData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentDoctorsListImplCopyWith<$Res>
    implements $AppointmentDoctorsListCopyWith<$Res> {
  factory _$$AppointmentDoctorsListImplCopyWith(
          _$AppointmentDoctorsListImpl value,
          $Res Function(_$AppointmentDoctorsListImpl) then) =
      __$$AppointmentDoctorsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'profile_pic') String? profilePic,
      int? id,
      String? name,
      String? email,
      String? specialization,
      String? services,
      String? fees,
      String? location,
      String? availability,
      String? about,
      String? latitude,
      String? longitude,
      @JsonKey(name: 'address_data') String? address,
      @JsonKey(name: 'serviceModelData') Service? serviceData,
      @JsonKey(name: 'specialistModelData') Specialist? specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      List<DoctorTimeTable> doctorTimeTable,
      @JsonKey(name: 'is_active') bool? isActive});

  @override
  $ServiceCopyWith<$Res>? get serviceData;
  @override
  $SpecialistCopyWith<$Res>? get specialistData;
}

/// @nodoc
class __$$AppointmentDoctorsListImplCopyWithImpl<$Res>
    extends _$AppointmentDoctorsListCopyWithImpl<$Res,
        _$AppointmentDoctorsListImpl>
    implements _$$AppointmentDoctorsListImplCopyWith<$Res> {
  __$$AppointmentDoctorsListImplCopyWithImpl(
      _$AppointmentDoctorsListImpl _value,
      $Res Function(_$AppointmentDoctorsListImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePic = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? specialization = freezed,
    Object? services = freezed,
    Object? fees = freezed,
    Object? location = freezed,
    Object? availability = freezed,
    Object? about = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? serviceData = freezed,
    Object? specialistData = freezed,
    Object? doctorTimeTable = null,
    Object? isActive = freezed,
  }) {
    return _then(_$AppointmentDoctorsListImpl(
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceData: freezed == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as Service?,
      specialistData: freezed == specialistData
          ? _value.specialistData
          : specialistData // ignore: cast_nullable_to_non_nullable
              as Specialist?,
      doctorTimeTable: null == doctorTimeTable
          ? _value._doctorTimeTable
          : doctorTimeTable // ignore: cast_nullable_to_non_nullable
              as List<DoctorTimeTable>,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentDoctorsListImpl
    with DiagnosticableTreeMixin
    implements _AppointmentDoctorsList {
  const _$AppointmentDoctorsListImpl(
      {@JsonKey(name: 'profile_pic') this.profilePic,
      this.id,
      this.name,
      this.email,
      this.specialization,
      this.services,
      this.fees,
      this.location,
      this.availability,
      this.about,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'address_data') this.address,
      @JsonKey(name: 'serviceModelData') this.serviceData,
      @JsonKey(name: 'specialistModelData') this.specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      final List<DoctorTimeTable> doctorTimeTable = const [],
      @JsonKey(name: 'is_active') this.isActive})
      : _doctorTimeTable = doctorTimeTable;

  factory _$AppointmentDoctorsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentDoctorsListImplFromJson(json);

  @override
  @JsonKey(name: 'profile_pic')
  final String? profilePic;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? specialization;
  @override
  final String? services;
  @override
  final String? fees;
  @override
  final String? location;
  @override
  final String? availability;
  @override
  final String? about;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  @JsonKey(name: 'address_data')
  final String? address;
// @JsonKey(name: 'service_type') List<String>? serviceType,
  @override
  @JsonKey(name: 'serviceModelData')
  final Service? serviceData;
  @override
  @JsonKey(name: 'specialistModelData')
  final Specialist? specialistData;
  final List<DoctorTimeTable> _doctorTimeTable;
  @override
  @JsonKey(name: 'doctorTimeTableData')
  List<DoctorTimeTable> get doctorTimeTable {
    if (_doctorTimeTable is EqualUnmodifiableListView) return _doctorTimeTable;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorTimeTable);
  }

  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppointmentDoctorsList(profilePic: $profilePic, id: $id, name: $name, email: $email, specialization: $specialization, services: $services, fees: $fees, location: $location, availability: $availability, about: $about, latitude: $latitude, longitude: $longitude, address: $address, serviceData: $serviceData, specialistData: $specialistData, doctorTimeTable: $doctorTimeTable, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppointmentDoctorsList'))
      ..add(DiagnosticsProperty('profilePic', profilePic))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('specialization', specialization))
      ..add(DiagnosticsProperty('services', services))
      ..add(DiagnosticsProperty('fees', fees))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('availability', availability))
      ..add(DiagnosticsProperty('about', about))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('serviceData', serviceData))
      ..add(DiagnosticsProperty('specialistData', specialistData))
      ..add(DiagnosticsProperty('doctorTimeTable', doctorTimeTable))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentDoctorsListImpl &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.services, services) ||
                other.services == services) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.serviceData, serviceData) ||
                other.serviceData == serviceData) &&
            (identical(other.specialistData, specialistData) ||
                other.specialistData == specialistData) &&
            const DeepCollectionEquality()
                .equals(other._doctorTimeTable, _doctorTimeTable) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profilePic,
      id,
      name,
      email,
      specialization,
      services,
      fees,
      location,
      availability,
      about,
      latitude,
      longitude,
      address,
      serviceData,
      specialistData,
      const DeepCollectionEquality().hash(_doctorTimeTable),
      isActive);

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentDoctorsListImplCopyWith<_$AppointmentDoctorsListImpl>
      get copyWith => __$$AppointmentDoctorsListImplCopyWithImpl<
          _$AppointmentDoctorsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentDoctorsListImplToJson(
      this,
    );
  }
}

abstract class _AppointmentDoctorsList implements AppointmentDoctorsList {
  const factory _AppointmentDoctorsList(
      {@JsonKey(name: 'profile_pic') final String? profilePic,
      final int? id,
      final String? name,
      final String? email,
      final String? specialization,
      final String? services,
      final String? fees,
      final String? location,
      final String? availability,
      final String? about,
      final String? latitude,
      final String? longitude,
      @JsonKey(name: 'address_data') final String? address,
      @JsonKey(name: 'serviceModelData') final Service? serviceData,
      @JsonKey(name: 'specialistModelData') final Specialist? specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      final List<DoctorTimeTable> doctorTimeTable,
      @JsonKey(name: 'is_active')
      final bool? isActive}) = _$AppointmentDoctorsListImpl;

  factory _AppointmentDoctorsList.fromJson(Map<String, dynamic> json) =
      _$AppointmentDoctorsListImpl.fromJson;

  @override
  @JsonKey(name: 'profile_pic')
  String? get profilePic;
  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get specialization;
  @override
  String? get services;
  @override
  String? get fees;
  @override
  String? get location;
  @override
  String? get availability;
  @override
  String? get about;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  @JsonKey(name: 'address_data')
  String?
      get address; // @JsonKey(name: 'service_type') List<String>? serviceType,
  @override
  @JsonKey(name: 'serviceModelData')
  Service? get serviceData;
  @override
  @JsonKey(name: 'specialistModelData')
  Specialist? get specialistData;
  @override
  @JsonKey(name: 'doctorTimeTableData')
  List<DoctorTimeTable> get doctorTimeTable;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;

  /// Create a copy of AppointmentDoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentDoctorsListImplCopyWith<_$AppointmentDoctorsListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
