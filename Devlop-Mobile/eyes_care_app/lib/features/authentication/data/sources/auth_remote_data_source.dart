
import 'package:eyes_care_app/features/authentication/domain/requests/login_request.dart';
import '../../domain/requests/register_user_request.dart';

abstract class AuthRemoteDataSources {
  Future<void> loginWithEmail(LoginRequest request);
  Future<void> registerWithEmail(RegisterUserRequest request);
  Future<void> registerWithGoogle(RegisterUserRequest request);
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  @override
  Future<void> loginWithEmail(LoginRequest request) async {
    (await _handleRequest(
      method: 'post',
      endpoint: "login",
      data: request.toJson(),
    ));
  }

  @override
  Future<void> registerWithEmail(RegisterUserRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithGoogle(RegisterUserRequest request) {
    throw UnimplementedError();
  }

  Future<void> _handleRequest(
      {required String method, required String endpoint, Object? data}) async {
    // تجهيز الدوال حتى يكتمل شغل backend مع العيال
    if (method == "get") {
    } else if (method == "post") {
    } else if (method == "delete") {
    } else {
    }
  }
}
