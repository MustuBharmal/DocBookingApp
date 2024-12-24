import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/profile/models/faq_model.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';

abstract class ProfileRepo {
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
