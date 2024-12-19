import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';

import '../global/apis.dart';
import '../util/log_utils.dart';

class HttpService extends HttpOverrides {
  HttpService._internal();

  static final HttpService instance = HttpService._internal();
  static dio.Dio _dio = dio.Dio();
  final dio.BaseOptions _baseOptions = dio.BaseOptions(
    baseUrl: Api.baseUrl,
    validateStatus: (int? status) {
      return true;
    },
    headers: {
      'Content-Type': 'application/json',
      'own-access-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWRtaW4iLCJleHAiOjE3MDcxMTM4MDd9.81c8uR-Vl_kZkCCPZBKT5uJ_lQe8L0zoad_WVsAES2M'
    },
  );

  HttpService.initialize() {
    LogUtil.debug(Api.baseUrl);
    _dio = dio.Dio(_baseOptions);
  }

  static Future<dio.Response<dynamic>?> get(String path, Map<String, dynamic> params, String tokenString,
      {bool token = false}) async {
    dio.Response? result;
    try {
      LoaderController.instance.showLoader();
      final dio.Response response = await _dio.get(path,
          queryParameters: params, options: token ? dio.Options(headers: {'own-access-token': tokenString}) : null);
      LoaderController.instance.dismissLoader();
      if (response.statusCode == 200) {
        result = response;
      } else {
        LogUtil.error(response.data['message']);
      }
    } catch (e) {
      LogUtil.error(e);
    }
    return result?.data;
  }

  static Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data, String tokenString,
      {bool token = false}) async {
    Map<String, dynamic> result = {};
    try {
      LoaderController.instance.showLoader();

      final dio.Response response = await _dio.post(path,
          data: jsonEncode(data), options: token ? dio.Options(headers: {'own-access-token': tokenString}) : null);
      LoaderController.instance.dismissLoader();
      if (response.statusCode == 200) {
        result = response.data as Map<String, dynamic>;
        return result;
      }
      LogUtil.error(response.statusCode);
      throw Exception(response.statusMessage);
    } catch (e) {
      LogUtil.error(e);
    }
    return result;
  }

  static Future<Map<String, dynamic>> picPost(String path, dio.FormData data, String tokenString, {bool token = true}) async {
    Map<String, dynamic> result = {};
    try {
      LoaderController.instance.showLoader();
      final dio.Response response = await _dio.post(
        path,
        data: data,
        options: token
            ? dio.Options(headers: {
                'own-access-token': tokenString, // Ensure tokenString is used here
                'Content-Type': 'multipart/form-data',
              })
            : null,
      );
      LoaderController.instance.dismissLoader();
      if (response.statusCode == 200) {
        // Check if response data is a JSON map or a string
        if (response.data is Map<String, dynamic>) {
          result = response.data;
        } else if (response.data is String) {
          // Parse the string to JSON if it's a JSON string
          result = jsonDecode(response.data);
        } else {
          LogUtil.error("Unexpected response format");
        }
      } else {
        LogUtil.error("Request failed: ${response.data['message']}");
      }
    } catch (e) {
      LogUtil.error("Error: $e");
      rethrow;
    }
    return result;
  }
}
