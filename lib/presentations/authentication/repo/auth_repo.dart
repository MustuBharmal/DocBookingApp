import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/authentication/models/city_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/country_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/state_model.dart';
import 'package:doc_booking_app/presentations/authentication/models/user.dart';
import 'package:doc_booking_app/presentations/home/view/navigation_screen.dart';
import 'package:get/get.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../../../util/storage_util.dart';
import '../controller/authentication_controller.dart';
import '../views/account_verification_screen.dart';

abstract class AuthRepo {
  static const String _email = 'email';
  static const String _passwordKey = 'password';
  static const String _otpCodeKey = 'otp_code';
  static const String _otpKey = 'otp';
  static const String _newPassKey = 'newPassword';
  static const String _confirmPassKey = 'confirmPassword';
  static const String _resetTokenKey = 'resetToken';
  static const String _fcmTokenKey = 'firebase_token';

  // login is working
  static Future<User?> signIn(String email, String password, String fcmToken) async {
    try {
      final Map<String, dynamic> data = {_email: email, _passwordKey: password, _fcmTokenKey: fcmToken};
      LogUtil.debug(Api.signIn);
      LogUtil.debug(data);
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
        throw Exception("${result['data']['error']}");
      } else {
        throw Exception("${result['data']['error']}");
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

  static Future<bool> signOut() async {
    try {
      LogUtil.debug(Api.logOut);
      final result = await HttpService.post(Api.logOut, {}, token: true);
      if (result['status'] == 'success') {
        AuthController.instance.user.value = null;
        StorageUtil.deleteToken();
        StorageUtil.deleteUserId();
        StorageUtil.deleteUserData();
        LogUtil.debug('User logged out successfully');
        return true;
      } else {
        throw Exception("${result['message'] ?? 'Logout failed'}");
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
  static Future<User> otpVerification(String email, String otp, String fcmToken) async {
    try {
      final Map<String, dynamic> data = {_email: email, _otpCodeKey: otp, 'firebase_token': 'dddd'};
      LogUtil.debug(Api.otpVerification);
      final result = await HttpService.post(Api.otpVerification, data);
      LogUtil.debug(result);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        StorageUtil.writeToken(result['data']['access_token']);
        StorageUtil.writeUserId(result['data']['user']['id'].toString());
        return User.fromJson(result['data']['user'] as Map<String, dynamic>);
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

  // forget password
  static Future<bool> resetPassword(String newPass, String confirmPass) async {
    try {
      final Map<String, dynamic> data = {
        _resetTokenKey: StorageUtil.getToken(),
        _newPassKey: newPass,
        _confirmPassKey: confirmPass
      };
      LogUtil.debug(Api.resetPassword);
      final result = await HttpService.post(
        Api.resetPassword,
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
  static Future<User> signUp({
    required String name,
    required String email,
    required String sex,
    required String dob,
    required String phone,
    required String address,
    required String country,
    required String state,
    required String city,
    String? profilePic,
    required String password,
    required String pinCode,
    // required double lat,
    // required double long,
    bool showLoader = true,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'sex': sex,
        'dob': dob,
        'phone': phone,
        'address': address,
        'country': country,
        'state': state,
        'city': city,
        'profile_pic': profilePic ?? '/uploads/profile/2025-01-11T11-24-47.020Z-company_logo.png',
        'password': password,
        'pin_code': pinCode,
        // 'location_json': {'lat': lat, 'lng': long}
      };
      LogUtil.debug('json: $data');
      LogUtil.debug(Api.signUp);
      final result = await HttpService.post(Api.signUp, data, showLoader: showLoader);
      if (result['isLive'] == true) {
        LogUtil.debug(result);
        Get.snackbar('Success', result['message'].toString());
        return User.fromJson(result['data'] as Map<String, dynamic>);
      } else {
        throw Exception("${result['data']['error']}");
      }
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['data']['error']?.toString();
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  static Future<String?> uploadProfilePic(File picture, {bool showLoader = true}) async {
    try {
      final dio.FormData data = dio.FormData.fromMap({'files': await dio.MultipartFile.fromFile(picture.path)});
      final result = await HttpService.picPost(Api.imageUpload, data, showLoader: showLoader);
      if (result['isLive'] == true) {
        return result['data']['store_url'];
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
        throw Exception("${result['message']}");
      } else {
        throw Exception("${result['message']}");
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
      final result = await HttpService.post(Api.country, {}, showLoader: false);
      LogUtil.debug(result);
      if (result['code'] == 200) {
        final CountryResponse countryResponse = CountryResponse.fromJson(result);
        if (countryResponse.success) {
          return countryResponse.data;
        } else {
          throw Exception('Error: ${countryResponse.message}');
        }
      }
      return [];
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String errMessage = errData['message'].toString();
        throw errMessage;
      }
      rethrow;
    }
  }

  // get states
  static Future<List<StateModel>> getState(String countryId) async {
    try {
      final result = await HttpService.post(Api.state, {'country_id': countryId}, showLoader: false);
      LogUtil.debug(result);
      if (result['code'] == 200) {
        final StateResponse stateResponse = StateResponse.fromJson(result);
        if (stateResponse.success) {
          return stateResponse.data;
        } else {
          throw Exception('Error: ${stateResponse.message}');
        }
      }
      return [];
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['message'];
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  // get cities
  static Future<List<CityModel>> getCities(String stateId) async {
    try {
      final result = await HttpService.post(Api.city, {'state_id': stateId}, showLoader: false);
      LogUtil.debug(result);
      if (result['code'] == 200) {
        final CityResponse cityResponse = CityResponse.fromJson(result);
        if (cityResponse.success) {
          return cityResponse.data;
        } else {
          throw Exception('Error: ${cityResponse.message}');
        }
      }
      return [];
    } on ServerException catch (e) {
      LogUtil.error(e);
      rethrow;
    } catch (e) {
      if (e is dio.DioException) {
        final errData = (e).response!.data;
        final String? errMessage = errData['message'];
        throw errMessage ?? 'Please try again';
      }
      rethrow;
    }
  }

  // validate otp for forget password

// otp verification
  static Future<bool> validateOtpPassword(String email, String otp) async {
    try {
      final Map<String, dynamic> data = {
        _email: email,
        _otpKey: int.parse(otp),
      };
      LogUtil.debug(Api.validateOtpForgetPassword);
      LogUtil.debug(data);
      final result = await HttpService.post(
        Api.validateOtpForgetPassword,
        data,
        token: false,
      );
      if (result['isLive'] == true) {
        StorageUtil.deleteToken();
        StorageUtil.writeToken(result['data']['resetToken']);
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
}
