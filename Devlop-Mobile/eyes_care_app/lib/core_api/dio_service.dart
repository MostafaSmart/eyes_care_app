import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eyes_care_app/core_api/api_constants.dart';
import 'package:eyes_care_app/core_api/api_response_model.dart';
import 'package:eyes_care_app/core_api/public_interceptor.dart';
import '../core/helper/app_print_class.dart';
import 'error&success_abstracts/error_strings.dart';

class DioService {
  final int connectTimeout = 60;
  late Dio _dio;
  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        // contentType: 'application/json',
        followRedirects: true,
        validateStatus: (status) {
          AppPrint.printError(
              "?????????????Validate status in dio_service: $status");
          return true;
        },
      ),
    );
    _dio.interceptors.add(PublicInterceptor());
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
  Future<ApiResponseModel> get(String path, [Object? data]) async {
    CancelToken cancelToken = CancelToken();
    final Response response =
        await _dio.get(path, cancelToken: cancelToken, data: data);
    if (response.statusCode == 200) {
      ApiResponseModel responseModel =
          ApiResponseModel.fromJson(jsonDecode(response.data));
      return responseModel;
    } else {
      return ApiResponseModel(
        status: false,
        message: response.statusMessage ?? ErrorString.SERVER_ERROR,
      );
    }
  }

  Future<ApiResponseModel> post(String path, [Object? data]) async {
    CancelToken cancelToken = CancelToken();
    final Response response =
        await _dio.post(path, cancelToken: cancelToken, data: data);
    if (response.statusCode == 200) {
      ApiResponseModel responseModel =
          ApiResponseModel.fromJson(jsonDecode(response.data));
      return responseModel;
    } else {
      return ApiResponseModel(
        status: false,
        message: response.statusMessage ?? ErrorString.SERVER_ERROR,
      );
    }
  }
}
