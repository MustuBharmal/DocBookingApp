import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/specialist/models/doctor_time_table.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../models/doctor_list.dart';

class SpecialistRepo {

  static Future<List<DoctorsList>> getDoctorsBySpecialization(int serviceId, double lat, double long) async {
    try {
      Map<String, dynamic> data = {
        'userLatitude': lat,
        'userLongitude': long,
        'specialization_id': serviceId,
        'radius': 50,
      };
      // List<DoctorsList?> listOfSpecialist = [];
      LogUtil.debug(Api.nearByDoctors);
      final result = await HttpService.post(Api.nearByDoctors, data, showLoader: false);
      LogUtil.debug(result);
      if (result['isLive'] == true) {
        final response = DoctorListResponse.fromJson(result);
        return response.data;
      } else {
        throw Exception("Error: ${result['message']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        var errData = (e).response!.data;
        var errMessage = errData['message'];
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  static Future<List<DoctorTimeTable>> getDoctorTimeTable({int? doctorId, int? clinicId}) async {
    try {
      Map<String, dynamic> data = {
        if (doctorId != null) 'doctor_id': doctorId,
        if (clinicId != null) 'clinic_id': clinicId,
      };
      LogUtil.debug(data);
      final result = await HttpService.post(Api.doctorTimetable, data, showLoader: true);
      LogUtil.debug(result);
      if (result['isLive'] == true) {
        final response = DoctorTimeTableResponse.fromJson(result);
        return response.data;
      } else {
        throw Exception("Error: ${result['message']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        var errData = (e).response!.data;
        var errMessage = errData['message'];
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }
}
