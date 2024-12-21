import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/user.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
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
      final Map<String, dynamic> data = {
        _email: email,
        _passwordKey: password,
      };
      LogUtil.debug(Api.signIn);
      final result = await HttpService.post(Api.signIn, data);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        StorageUtil.writeToken(result['data']['access_token'].toString());
        StorageUtil.writeUserId(result['data']['user']['id'].toString());
        Get.offAllNamed(NavigationScreen.routeName);
        return User.fromJson(result['data']['user'] as Map<String, dynamic>);
      } else if (result['isLive'] == false) {
        LogUtil.debug(result);
        StorageUtil.writeToken(result['data']['access_token'].toString());
        StorageUtil.writeUserId(result['data']['user']['id'].toString());
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
        final errData = (e).response!.data;
        final String? errMessage = errData['message']?.toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  // otp verification
  static Future<bool> otpVerification(String email, String otp) async {
    try {
      final Map<String, dynamic> data = {
        _email: email,
        _otpKey: otp,
      };
      LogUtil.debug(Api.otpVerification);
      final result = await HttpService.post(Api.otpVerification, data);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
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

  // forget password

  static Future<bool> forgetPassword(String email) async {
    try {
      final Map<String, dynamic> data = {
        _email: email,
      };
      LogUtil.debug(Api.forgetPassword);
      final result = await HttpService.post(
        Api.forgetPassword,
        data,
        token: false,
      );
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.snackbar('Success', result['message'].toString());
        return true;
      } else if (result['isLive'] == false) {
        throw Exception("Error: ${result['message']}");
      } else {
        throw Exception("Error: ${result['message']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['result']['message']?.toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  // signup method
  static Future<User> signUp(User user) async {
    try {
      final Map<String, dynamic> data = user.toJson();
      LogUtil.debug('json: $data');
      LogUtil.debug(Api.signUp);
      final result = await HttpService.post(Api.signUp, data);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.snackbar('Success', result['message'].toString());
        return User.fromJson(result['data'] as Map<String, dynamic>);
      } else {
        throw Exception("Error: ${result['message']}");
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

  // get user
  static Future<User> getUser() async {
    try {
      LogUtil.debug(Api.profile);
      final result = await HttpService.get(Api.profile, {}, token: true);
      if (result['isLive'] == true) {
        LogUtil.debug(result['data']);
        return User.fromJson(result['data'] as Map<String, dynamic>);
      } else if (result['isLive'] == false) {
        throw Exception("Error: ${result['message']}");
      } else {
        throw Exception("Error: ${result['message']}");
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

  static Future<List<CountryModel>> getCountries() async {
    try {
      LogUtil.debug(Api.profile);
      final result = await HttpService.post(
        Api.country,
        {},
      );
      if (result['code'] == 200) {
        final CountryResponse countryResponse = CountryResponse.fromJson(result);
        if (countryResponse.success) {
          return countryResponse.data;
        } else {
          throw Exception('Error: ${countryResponse.message}');
        }
      }
      return [];
      //   LogUtil.debug(result['data']);
      //   return User.fromJson(result['data']);
      // } else if (!result['isLive']) {
      //   throw Exception("Error: ${result['message']}");
      // } else {
      //   throw Exception("Error: ${result['message']}");
      // }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['message'].toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }
}
