// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardImpl _$$DashboardImplFromJson(Map<String, dynamic> json) =>
    _$DashboardImpl(
      aboutUs: json['about-us'] as String?,
      privacyPolicy: json['privacy-policy'] as String?,
      teamsCondition: json['teams-condition'] as String?,
      upcomingAppointments: (json['upcoming_appointments'] as List<dynamic>?)
              ?.map((e) =>
                  UpcomingAppointmentsData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DashboardImplToJson(_$DashboardImpl instance) =>
    <String, dynamic>{
      'about-us': instance.aboutUs,
      'privacy-policy': instance.privacyPolicy,
      'teams-condition': instance.teamsCondition,
      'upcoming_appointments': instance.upcomingAppointments,
    };

_$UpcomingAppointmentsDataImpl _$$UpcomingAppointmentsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UpcomingAppointmentsDataImpl(
      id: (json['id'] as num?)?.toInt(),
      patientId: (json['patient_id'] as num?)?.toInt(),
      doctorId: (json['doctor_id'] as num?)?.toInt(),
      clinicId: (json['clinic_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      bookingCode: json['booking_code'] as String?,
      status: json['status'] as String?,
      isPaymentDone: json['is_payment_done'] as bool?,
      createdAt: json['createdAt'] as String?,
      doctorData: json['doctorData'] == null
          ? null
          : AppointmentDoctorsList.fromJson(
              json['doctorData'] as Map<String, dynamic>),
      patientData: json['patientData'] == null
          ? null
          : PatientData.fromJson(json['patientData'] as Map<String, dynamic>),
      doctorTimeTableData: json['doctorTimeTableData'] == null
          ? null
          : DoctorTimeTableData.fromJson(
              json['doctorTimeTableData'] as Map<String, dynamic>),
      clinicData: json['clinicData'] == null
          ? null
          : AppointmentDoctorsList.fromJson(
              json['clinicData'] as Map<String, dynamic>),
      typeData: json['type_data'] as String?,
    );

Map<String, dynamic> _$$UpcomingAppointmentsDataImplToJson(
        _$UpcomingAppointmentsDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_id': instance.patientId,
      'doctor_id': instance.doctorId,
      'clinic_id': instance.clinicId,
      'amount': instance.amount,
      'booking_code': instance.bookingCode,
      'status': instance.status,
      'is_payment_done': instance.isPaymentDone,
      'createdAt': instance.createdAt,
      'doctorData': instance.doctorData,
      'patientData': instance.patientData,
      'doctorTimeTableData': instance.doctorTimeTableData,
      'clinicData': instance.clinicData,
      'type_data': instance.typeData,
    };

_$PatientDataImpl _$$PatientDataImplFromJson(Map<String, dynamic> json) =>
    _$PatientDataImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$PatientDataImplToJson(_$PatientDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

_$DoctorTimeTableDataImpl _$$DoctorTimeTableDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorTimeTableDataImpl(
      id: (json['id'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$DoctorTimeTableDataImplToJson(
        _$DoctorTimeTableDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$AppointmentDoctorsListImpl _$$AppointmentDoctorsListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentDoctorsListImpl(
      profilePic: json['profile_pic'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      specialization: json['specialization'] as String?,
      services: json['services'] as String?,
      fees: json['fees'] as String?,
      location: json['location'] as String?,
      availability: json['availability'] as String?,
      about: json['about'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      address: json['address_data'] as String?,
      serviceData: json['serviceModelData'] == null
          ? null
          : Service.fromJson(json['serviceModelData'] as Map<String, dynamic>),
      specialistData: json['specialistModelData'] == null
          ? null
          : Specialist.fromJson(
              json['specialistModelData'] as Map<String, dynamic>),
      doctorTimeTable: (json['doctorTimeTableData'] as List<dynamic>?)
              ?.map((e) => DoctorTimeTable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$AppointmentDoctorsListImplToJson(
        _$AppointmentDoctorsListImpl instance) =>
    <String, dynamic>{
      'profile_pic': instance.profilePic,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'specialization': instance.specialization,
      'services': instance.services,
      'fees': instance.fees,
      'location': instance.location,
      'availability': instance.availability,
      'about': instance.about,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address_data': instance.address,
      'serviceModelData': instance.serviceData,
      'specialistModelData': instance.specialistData,
      'doctorTimeTableData': instance.doctorTimeTable,
      'is_active': instance.isActive,
    };
