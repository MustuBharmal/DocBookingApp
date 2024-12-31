// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorListResponse _$DoctorListResponseFromJson(Map<String, dynamic> json) {
  return _DoctorListResponse.fromJson(json);
}

/// @nodoc
mixin _$DoctorListResponse {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLive')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<DoctorsList> get data => throw _privateConstructorUsedError;

  /// Serializes this DoctorListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorListResponseCopyWith<DoctorListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorListResponseCopyWith<$Res> {
  factory $DoctorListResponseCopyWith(
          DoctorListResponse value, $Res Function(DoctorListResponse) then) =
      _$DoctorListResponseCopyWithImpl<$Res, DoctorListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'isLive') bool success,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<DoctorsList> data});
}

/// @nodoc
class _$DoctorListResponseCopyWithImpl<$Res, $Val extends DoctorListResponse>
    implements $DoctorListResponseCopyWith<$Res> {
  _$DoctorListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = null,
    Object? status = freezed,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DoctorsList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorListResponseImplCopyWith<$Res>
    implements $DoctorListResponseCopyWith<$Res> {
  factory _$$DoctorListResponseImplCopyWith(_$DoctorListResponseImpl value,
          $Res Function(_$DoctorListResponseImpl) then) =
      __$$DoctorListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'isLive') bool success,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') List<DoctorsList> data});
}

/// @nodoc
class __$$DoctorListResponseImplCopyWithImpl<$Res>
    extends _$DoctorListResponseCopyWithImpl<$Res, _$DoctorListResponseImpl>
    implements _$$DoctorListResponseImplCopyWith<$Res> {
  __$$DoctorListResponseImplCopyWithImpl(_$DoctorListResponseImpl _value,
      $Res Function(_$DoctorListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? success = null,
    Object? status = freezed,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$DoctorListResponseImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DoctorsList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorListResponseImpl
    with DiagnosticableTreeMixin
    implements _DoctorListResponse {
  const _$DoctorListResponseImpl(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'isLive') this.success = false,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'data') final List<DoctorsList> data = const []})
      : _data = data;

  factory _$DoctorListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorListResponseImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'isLive')
  final bool success;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'message')
  final String? message;
  final List<DoctorsList> _data;
  @override
  @JsonKey(name: 'data')
  List<DoctorsList> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoctorListResponse(code: $code, success: $success, status: $status, message: $message, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoctorListResponse'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, success, status, message,
      const DeepCollectionEquality().hash(_data));

  /// Create a copy of DoctorListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorListResponseImplCopyWith<_$DoctorListResponseImpl> get copyWith =>
      __$$DoctorListResponseImplCopyWithImpl<_$DoctorListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorListResponseImplToJson(
      this,
    );
  }
}

abstract class _DoctorListResponse implements DoctorListResponse {
  const factory _DoctorListResponse(
          {@JsonKey(name: 'code') final int? code,
          @JsonKey(name: 'isLive') final bool success,
          @JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'data') final List<DoctorsList> data}) =
      _$DoctorListResponseImpl;

  factory _DoctorListResponse.fromJson(Map<String, dynamic> json) =
      _$DoctorListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'isLive')
  bool get success;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  List<DoctorsList> get data;

  /// Create a copy of DoctorListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorListResponseImplCopyWith<_$DoctorListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorsList _$DoctorsListFromJson(Map<String, dynamic> json) {
  return _DoctorsList.fromJson(json);
}

/// @nodoc
mixin _$DoctorsList {
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
  @JsonKey(name: 'service_type')
  List<String>? get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceModelData')
  Service? get serviceData => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialistModelData')
  Specialist? get specialistData => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctorTimeTableData')
  List<DoctorTimeTable> get doctorTimeTable =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this DoctorsList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorsListCopyWith<DoctorsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorsListCopyWith<$Res> {
  factory $DoctorsListCopyWith(
          DoctorsList value, $Res Function(DoctorsList) then) =
      _$DoctorsListCopyWithImpl<$Res, DoctorsList>;
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
      @JsonKey(name: 'service_type') List<String>? serviceType,
      @JsonKey(name: 'serviceModelData') Service? serviceData,
      @JsonKey(name: 'specialistModelData') Specialist? specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      List<DoctorTimeTable> doctorTimeTable,
      @JsonKey(name: 'is_active') bool? isActive});

  $ServiceCopyWith<$Res>? get serviceData;
  $SpecialistCopyWith<$Res>? get specialistData;
}

/// @nodoc
class _$DoctorsListCopyWithImpl<$Res, $Val extends DoctorsList>
    implements $DoctorsListCopyWith<$Res> {
  _$DoctorsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorsList
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
    Object? serviceType = freezed,
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
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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

  /// Create a copy of DoctorsList
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

  /// Create a copy of DoctorsList
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
abstract class _$$DoctorsListImplCopyWith<$Res>
    implements $DoctorsListCopyWith<$Res> {
  factory _$$DoctorsListImplCopyWith(
          _$DoctorsListImpl value, $Res Function(_$DoctorsListImpl) then) =
      __$$DoctorsListImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'service_type') List<String>? serviceType,
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
class __$$DoctorsListImplCopyWithImpl<$Res>
    extends _$DoctorsListCopyWithImpl<$Res, _$DoctorsListImpl>
    implements _$$DoctorsListImplCopyWith<$Res> {
  __$$DoctorsListImplCopyWithImpl(
      _$DoctorsListImpl _value, $Res Function(_$DoctorsListImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorsList
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
    Object? serviceType = freezed,
    Object? serviceData = freezed,
    Object? specialistData = freezed,
    Object? doctorTimeTable = null,
    Object? isActive = freezed,
  }) {
    return _then(_$DoctorsListImpl(
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
      serviceType: freezed == serviceType
          ? _value._serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
class _$DoctorsListImpl with DiagnosticableTreeMixin implements _DoctorsList {
  const _$DoctorsListImpl(
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
      @JsonKey(name: 'service_type') final List<String>? serviceType,
      @JsonKey(name: 'serviceModelData') this.serviceData,
      @JsonKey(name: 'specialistModelData') this.specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      final List<DoctorTimeTable> doctorTimeTable = const [],
      @JsonKey(name: 'is_active') this.isActive})
      : _serviceType = serviceType,
        _doctorTimeTable = doctorTimeTable;

  factory _$DoctorsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorsListImplFromJson(json);

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
  final List<String>? _serviceType;
  @override
  @JsonKey(name: 'service_type')
  List<String>? get serviceType {
    final value = _serviceType;
    if (value == null) return null;
    if (_serviceType is EqualUnmodifiableListView) return _serviceType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
    return 'DoctorsList(profilePic: $profilePic, id: $id, name: $name, email: $email, specialization: $specialization, services: $services, fees: $fees, location: $location, availability: $availability, about: $about, latitude: $latitude, longitude: $longitude, serviceType: $serviceType, serviceData: $serviceData, specialistData: $specialistData, doctorTimeTable: $doctorTimeTable, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoctorsList'))
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
      ..add(DiagnosticsProperty('serviceType', serviceType))
      ..add(DiagnosticsProperty('serviceData', serviceData))
      ..add(DiagnosticsProperty('specialistData', specialistData))
      ..add(DiagnosticsProperty('doctorTimeTable', doctorTimeTable))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorsListImpl &&
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
            const DeepCollectionEquality()
                .equals(other._serviceType, _serviceType) &&
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
      const DeepCollectionEquality().hash(_serviceType),
      serviceData,
      specialistData,
      const DeepCollectionEquality().hash(_doctorTimeTable),
      isActive);

  /// Create a copy of DoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorsListImplCopyWith<_$DoctorsListImpl> get copyWith =>
      __$$DoctorsListImplCopyWithImpl<_$DoctorsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorsListImplToJson(
      this,
    );
  }
}

abstract class _DoctorsList implements DoctorsList {
  const factory _DoctorsList(
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
      @JsonKey(name: 'service_type') final List<String>? serviceType,
      @JsonKey(name: 'serviceModelData') final Service? serviceData,
      @JsonKey(name: 'specialistModelData') final Specialist? specialistData,
      @JsonKey(name: 'doctorTimeTableData')
      final List<DoctorTimeTable> doctorTimeTable,
      @JsonKey(name: 'is_active') final bool? isActive}) = _$DoctorsListImpl;

  factory _DoctorsList.fromJson(Map<String, dynamic> json) =
      _$DoctorsListImpl.fromJson;

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
  @JsonKey(name: 'service_type')
  List<String>? get serviceType;
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

  /// Create a copy of DoctorsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorsListImplCopyWith<_$DoctorsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
