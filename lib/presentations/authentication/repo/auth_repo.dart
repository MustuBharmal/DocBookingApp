import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/authentication/models/user.dart';

import '../../../exception/server_exception.dart';
import '../../../global/apis.dart';
import '../../../service/http_service.dart';
import '../../../util/log_utils.dart';
import '../../../util/storage_util.dart';

abstract class AuthRepo {
  // static const String _emailKey = 'email';
  static const String _email = 'email';
  static const String _passwordKey = 'password';

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
      }else if(!result['isLive']){
        LogUtil.debug("Account is not verified");
        LogUtil.debug(result['message']);
        throw Exception(result['message']);
        // otp screen
      }/* else if (result['status'] == 404) {
        throw result['result']['message'];
      } else if (result['status'] == 401) {
        return false; // Handle invalid credentials
      } */
      else {
        throw Exception("Unexpected error: ${result['status']}");
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

// // fetching user is working
// static Future<UserModel> getUser() async {
//   try {
//     Map<String, dynamic> data = {
//       _idKey: int.parse(StorageUtil.getUserId()!),
//     };
//     var formData = dio.FormData.fromMap(data);
//     final response = await HttpService.formDataFunGet(_getUserPath,
//         data: formData, token: true);
//     if (response['success']) {
//       return UserModel.fromJson(response['result']);
//     } else if (response['status'] == 404) {
//       throw 'User not found';
//     } else {
//       throw 'Failed to get user data';
//     }
//   } catch (e) {
//     if (e is dio.DioException) {
//       var errData = (e).response!.data;
//       var errMessage = errData['error']['message'];
//       throw errMessage ?? 'Please try again';
//     }
//     rethrow;
//   }
// }
//
// // register user is working
// static Future<bool> registerAccount(String name, String emailAddress,
//     String password, String contactNo) async {
//   try {
//     Map<String, dynamic> data = {
//       _nameKey: name,
//       _emailAddressKey: emailAddress,
//       _passwordKey: password,
//       _contactNoKey: contactNo,
//     };
//     final result = await HttpService.post(_registerPath, data, token: false);
//     if (result['success']) {
//       LogUtil.debug(result);
//       return result['result']['canLogin'];
//     } else {
//       Get.snackbar('Error', result['error']['message']);
//       return false;
//     }
//   } catch (e) {
//     if (e is dio.DioException) {
//       var errData = (e).response!.data;
//       var errMessage = errData['error']['message'];
//       throw errMessage ?? 'Please try again';
//     }
//     rethrow;
//   }
// }
//
// // Method to handle forgot password
//
// static Future<bool> forgotPassword(String email) async {
//   try {
//     Map<String, dynamic> data = {
//       _emailKey: email,
//     };
//     final result =
//     await HttpService.post(_forgotPasswordPath, data, token: false);
//     if (result['success']) {
//       LogUtil.debug(result);
//       return true; // Indicate success
//     } else {
//       throw 'Failed to send password reset email';
//     }
//   } on ServerException catch (e) {
//     LogUtil.error(e);
//     rethrow;
//   } catch (e) {
//     LogUtil.error(e.toString());
//     rethrow;
//   }
// }
//
// // update user is working
//
// static Future<UserModel> updateUserProfile(UserModel user) async {
//   try {
//     final response =
//     await HttpService.put(_updateUserProfilePath, user.toJson());
//     if (response['success']) {
//       LogUtil.debug(response['result']);
//       return UserModel.fromJson(response['result']);
//     } else {
//       throw 'Failed to get user data';
//     }
//   } catch (e) {
//     if (e is dio.DioException) {
//       var errData = (e).response!.data;
//       var errMessage = errData['error']['message'];
//       throw errMessage ?? 'Please try again';
//     }
//     rethrow;
//   }
// }
//
// // create user is working
//
// static Future<UserModel> createUserProfile(UserModel user) async {
//   try {
//     final response =
//     await HttpService.post(_createUserProfilePath, user.toJson());
//     if (response['success']) {
//       LogUtil.debug(response['result']);
//       return UserModel.fromJson(response['result']);
//     } else {
//       throw 'Failed to get user data';
//     }
//   } catch (e) {
//     if (e is dio.DioException) {
//       var errData = (e).response!.data;
//       var errMessage = errData['error']['message'];
//       throw errMessage ?? 'Please try again';
//     }
//     rethrow;
//   }
// }
//
// //third party login/signup
//
// static Future<ThirdPartyLoginModel> thirdPartyLogin(ThirdPartyLoginModel user) async{
//   try {
//     final response = await HttpService.post(_thirdPartyLoginPath, user.toJson());
//     if (response['success']) {
//       StorageUtil.writeToken(response['result']['token']);
//       StorageUtil.writeUserId(response['result']['uid']);
//       return ThirdPartyLoginModel.fromJson(response['result']);
//     } else {
//       throw 'Failed to get user data';
//     }
//   } catch (e) {
//     if (e is dio.DioException) {
//       var errData = (e).response!.data;
//       var errMessage = errData['error']['message'];
//       throw errMessage ?? 'Please try again';
//     }
//     rethrow;
//   }
// }
}
