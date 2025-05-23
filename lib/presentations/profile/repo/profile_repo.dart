import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/profile/controller/profile_controller.dart';
import 'package:doc_booking_app/presentations/profile/models/faq_model.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../../authentication/controller/authentication_controller.dart';
import '../../authentication/controller/loader_controller.dart';
import '../../authentication/repo/auth_repo.dart';
import '../models/booking_list.dart';

abstract class ProfileRepo {
  static Future<BookingListResponse?> getBookingDetails() async {
    try {
      Map<String, dynamic> data = {};
      LogUtil.debug(Api.myBooking);
      final result =
          await HttpService.post(Api.myBooking, data, showLoader: false);
      if (result['isLive'] == true) {
        return BookingListResponse.fromJson(result);
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

  static Future<List<FaqModels?>> getFaqs() async {
    try {
      List<FaqModels?> list = [];
      LogUtil.debug(Api.faqs);
      final result =
          await HttpService.get(Api.faqs, {}, token: true, showLoader: false);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        list = List<FaqModels>.from(
            result['data']!.map((x) => FaqModels.fromJson(x)));
        return list;
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

  static Future<bool> prescriptionForm(Map<String, dynamic> params) async {
    try {
      LogUtil.debug(Api.prescriptionForm);
      final result =
          await HttpService.post(Api.prescriptionForm, params, token: true);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.back();
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

  static Future<bool> updateProfileApi(Map<String, dynamic> params) async {
    try {
      LogUtil.debug(params);
      final result = await HttpService.post(Api.updateProfile, params,
          token: true, showLoader: false);

      if (result['isLive'] == true) {
        LogUtil.debug(result);
        AuthController.instance.user.value = await AuthRepo.getUser();
        LoaderController.instance.dismissLoader();

        Get.back();
        Get.back();
        Get.snackbar('Success', result['message']);
        ProfileController.instance.initializeControllers();
        return true;
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

  static Future<bool> contactUsApi(Map<String, dynamic> params) async {
    try {
      LogUtil.debug(Api.contactUs);
      final result = await HttpService.post(Api.contactUs, params);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.back();
        Get.snackbar('Success', result['message']);
        return true;
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

  static Future<bool> howToBePartner(Map<String, dynamic> params) async {
    try {
      LogUtil.debug(Api.howToBePartner);
      final result = await HttpService.post(Api.howToBePartner, params);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.back();
        Get.snackbar('Success', result['message']);
        return true;
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
