import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:doc_booking_app/presentations/authentication/controller/loader_controller.dart';
import 'package:doc_booking_app/util/storage_util.dart';

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

  static Future<Map<String, dynamic>> get(String path, Map<String, dynamic> params,
      {bool token = false, bool showLoader = true}) async {
    Map<String, dynamic> result = {};
    try {
      showLoader ? LoaderController.instance.showLoader() : null;
      LogUtil.debug(StorageUtil.getToken());
      final dio.Response response = await _dio.get(
        path,
        queryParameters: params,
        options: token ? dio.Options(headers: {'own-access-token': 'Bearer ${StorageUtil.getToken().toString()}'}) : null,
      );
      showLoader ? LoaderController.instance.dismissLoader() : null;
      if (response.statusCode == 200) {
        result = response.data as Map<String, dynamic>;
      } else {
        if (response.data != null && response.data['data'] is Map<String, String>) {
          throw CustomErrorMap(response.data['message'] ?? '', errors: response.data['data']);
        }
        LogUtil.error(response.data);
        LogUtil.error(response.data['message']);
      }
    } catch (e) {
      LogUtil.error(e);
    }
    return result;
  }

  static Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data,
      {bool token = true, bool showLoader = true}) async {
    Map<String, dynamic> result = {};
    try {
      showLoader ? LoaderController.instance.showLoader() : null;

      final dio.Response response = await _dio.post(
        path,
        data: jsonEncode(data),
        options: token
            ? dio.Options(
                headers: {
                  'own-access-token': 'Bearer ${StorageUtil.getToken().toString()}',
                },
              )
            : null,
      );
      showLoader ? LoaderController.instance.dismissLoader() : null;
      if (response.statusCode == 200) {
        result = response.data as Map<String, dynamic>;
        return result;
      }
      LogUtil.error(response.statusCode);
      if (response.data != null && response.data['data'] is Map<String, String>) {
        throw CustomErrorMap(response.data['message'] ?? '', errors: response.data['data']);
      }
      throw Exception(response.statusMessage);
    } catch (e) {
      LogUtil.error(e);
    }
    return result;
  }

  static Future<Map<String, dynamic>> picPost(String path, dio.FormData data, {bool token = true, bool showLoader = true}) async {
    Map<String, dynamic> result = {};
    try {
      if (showLoader) LoaderController.instance.showLoader();
      LogUtil.debug(data.files);
      final dio.Response response = await _dio.post(
        path,
        data: data,
        options: token
            ? dio.Options(headers: {
                'own-access-token': StorageUtil.getToken().toString(), // Ensure tokenString is used here
                'Content-Type': 'multipart/form-data',
              })
            : null,
      );
      if (showLoader) LoaderController.instance.dismissLoader();
      if (response.statusCode == 200) {
        // Check if response data is a JSON map or a string
        if (response.data is Map<String, dynamic>) {
          result = response.data as Map<String, dynamic>;
        } else if (response.data is String) {
          // Parse the string to JSON if it's a JSON string
          result = jsonDecode(response.data.toString()) as Map<String, dynamic>;
        } else {
          LogUtil.error("Unexpected response format");
        }
      } else {
        LogUtil.error("Request failed: ${response.data['message']}");
      }
    } catch (e) {
      if (showLoader) LoaderController.instance.dismissLoader();
      LogUtil.error("Error: $e");
      rethrow;
    }
    return result;
  }
}

class CustomErrorMap extends HttpException {
  CustomErrorMap(super.message, {required this.errors});

  Map<String, String> errors;
}
