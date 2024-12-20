import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/authentication/models/user.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../../../util/storage_util.dart';
import '../views/account_verification_screen.dart';

abstract class AuthRepo {
  static const String _email = 'email';
  static const String _passwordKey = 'password';
  static const String _otpKey = 'otp_code';

  // login is working
  static Future<User?> signIn(String email, String password) async {
    try {
      Map<String, dynamic> data = {
        _email: email,
        _passwordKey: password,
      };
      LogUtil.debug(Api.signIn);
      final result = await HttpService.post(Api.signIn, data, '');
      if (result['isLive'] == true) {
        LogUtil.debug(result);

        StorageUtil.writeToken(result['data']['access_token']);
        StorageUtil.writeUserId(result['data']['user']['id']);

        return User.fromJson(result['data']['user']);
      } else if (!result['isLive']) {
        LogUtil.debug(result);
        Get.toNamed(AccountVerificationScreen.routeName);
        throw Exception(result['message']);
      } else {
        throw Exception("Error: ${result['status']}");
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

  // otp verification
  static Future<bool> otpVerification(String email, String otp) async {
    try {
      Map<String, dynamic> data = {
        _email: email,
        _otpKey: otp,
      };
      LogUtil.debug(Api.otpVerification);
      final result = await HttpService.post(Api.otpVerification, data, '');
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.snackbar('Success', result['message']);
        return true;
      } else {
        throw Exception("Error: ${result['status']}");
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

  // signup method
  static Future<void> signUp(User user) async {
    try {
      Map<String, dynamic> data = user.toJson();
      LogUtil.debug('json: $data');
      LogUtil.debug(Api.otpVerification);
      final result = await HttpService.post(Api.signUp, data, '');
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.snackbar('Success', result['message']);
        return;
      }else if (!result['isLive'] == true) {
        Get.toNamed(AccountVerificationScreen.routeName);
        return;
      } else {
        throw Exception("Error: ${result['status']}");
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
