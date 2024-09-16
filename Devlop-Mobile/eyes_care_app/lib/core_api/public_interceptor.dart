
import 'package:dio/dio.dart';
import 'package:eyes_care_app/core/hive_boxes/auth_box.dart';
import 'package:eyes_care_app/core_api/api_constants.dart';

class PublicInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = ApiConstants.header;
    String? authToken = AuthBox.getAuthToken();
    if (authToken != null) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    return super.onRequest(options, handler);
  }
}
