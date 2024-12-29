import 'package:dio/dio.dart' as dio;

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../models/doctor_list.dart';

class SpecialistRepo {
  static Future<List<DoctorsList>> getDoctors(int serviceId, double lat, double long) async {
    try {
      Map<String, dynamic> data = {
        'userLatitude': 85.06249589385241,
        'userLongitude': -178.81930852609128,
        'service_id': 5,
        // 'userLatitude': lat,
        // 'userLongitude': long,
        // 'service_id': serviceId,
        'radius': 50,
      };
      // List<DoctorsList?> listOfSpecialist = [];
      LogUtil.debug(Api.nearByDoctors);
      final result = await HttpService.post(Api.nearByDoctors, data, showLoader: false);
      LogUtil.debug(result);
      if (result['isLive'] == true) {
        final response = DoctorListResponse.fromJson(result);
        return response.data;
        /*listOfSpecialist = List<DoctorsList>.from(
            result['data']!.map((x) => DoctorsList.fromJson(x)));*/
        // return listOfSpecialist;
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
