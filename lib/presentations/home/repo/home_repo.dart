import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/home/models/dashboard.dart';
import 'package:doc_booking_app/presentations/services/models/service.dart';
import 'package:doc_booking_app/presentations/specialist/models/doctor_list.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../../specialist/models/specialist.dart';
import '../models/notification_model.dart';

abstract class HomeRepo {
  static Future<Dashboard?> dashboardApi() async {
    try {
      Map<String, dynamic> data = {};
      LogUtil.debug(Api.dashboard);
      final result =
      await HttpService.post(Api.dashboard, data, showLoader: false);
      if (result['isLive'] == true) {
        // LogUtil.debug(result);
        return Dashboard.fromJson(result['data'] as Map<String, dynamic>);
      } else {
        throw Exception("Error: ${result['message']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        var errData = (e).response!.data;
        final String? errMessage = errData['message']?.toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }


  static Future<bool?> markAsReadNotificationApi(List<int?> notificationIds) async {
    try {
      // LogUtil.debug(Api.prescriptionForm);
      final result =
      await HttpService.post(Api.markAsRead, {
        'notificationIds': notificationIds,
      }, token: true);
      if (result['isLive'] == true) {
        // LogUtil.debug(result);
        Get.back();
        Get.snackbar('Success', result['message'].toString());
        return true;
      } else {
        throw Exception("Error: ${result['status']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['message']?.toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  static Future<List<Service?>> getServices() async {
    try {
      Map<String, dynamic> data = {};
      List<Service?> listOfServices = [];
      // LogUtil.debug(Api.services);
      final result =
      await HttpService.get(Api.services, data, showLoader: false);
      if (result['isLive'] == true) {
        listOfServices =
        List<Service>.from(result['data']!.map((x) => Service.fromJson(x)));
        // LogUtil.debug(result);
        return listOfServices;
      } else {
        throw Exception("Error: ${result['message']}");
      }
    } on ServerException catch (e) {
      // LogUtil.error(e);
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

  static Future<List<DoctorsList>> getDoctors() async {
    try {
      Map<String, dynamic> data = {};
      List<DoctorsList> listOfSpecialist = [];
      LogUtil.debug(Api.doctors);
      final result =
      await HttpService.post(Api.doctors, data, showLoader: false);
      if (result['isLive'] == true) {
        listOfSpecialist = List<DoctorsList>.from(
            result['data']!.map((x) => DoctorsList.fromJson(x)));
        return listOfSpecialist;
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

  static Future<List<Specialist?>> getSpecialistType() async {
    try {
      List<Specialist?> listOfSpecialist = [];
      LogUtil.debug(Api.specialistType);
      final result = await HttpService.get(Api.specialistType, {},
          token: true, showLoader: false);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        listOfSpecialist = List<Specialist>.from(
            result['data']!.map((x) => Specialist.fromJson(x)));
        return listOfSpecialist;
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

  static Future<List<NotificationModel>> getNotification() async {
    try {
      LogUtil.debug(Api.notification);
      final result =
      await HttpService.post(Api.notification, {}, showLoader: false);
      if (result['code'] == 200) {
        final NotificationResponse notificationResponse =
        NotificationResponse.fromJson(result);
        if (notificationResponse.success) {
          LogUtil.debug(notificationResponse.data);
          return notificationResponse.data;
        } else {
          throw Exception('Error: ${notificationResponse.message}');
        }
      }
      return [];
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