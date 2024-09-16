import 'package:dartz/dartz.dart';

import 'package:eyes_care_app/core_api/error&success_abstracts/error_strings.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/exception.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/failures.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/success.dart';
import 'package:eyes_care_app/core_api/network_info/network_info.dart';
import 'package:eyes_care_app/features/authentication/data/sources/auth_remote_data_source.dart';
import 'package:eyes_care_app/features/authentication/domain/entities/user.dart';
import 'package:eyes_care_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/login_request.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/register_user_request.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/reset_password_request.dart';

import '../../../../core/helper/app_print_class.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSources remoteDataSource = AuthRemoteDataSourcesImpl();
  NetworkInfo networkInfo = NetworkInfoImpl();
  @override
  Future<Either<Failure, User>> registerWithEmail(RegisterUserRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> registerWithGoogle(
      RegisterUserRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> loginWithEmail(LoginRequest request) async {
    var login = await _handleErrors(() async {
      return await remoteDataSource.loginWithEmail(request);
    });
    return login is User ? Right(login) : Left(login);
  }

  Future _handleErrors(Function registerFunc) async {
    try {
      if (await networkInfo.isConnected) {
        return await registerFunc();
      }
      AppPrint.printError(ErrorString.OFFLINE_ERROR);
      return OfflineFailure(message: ErrorString.OFFLINE_ERROR);
    } on AppException catch (e) {
      AppPrint.printError(
          ">>>>>>>>>>Catch AppException in auth repository: ${e.failure}");
      return (e.failure as ServerFailure);
    } catch (e) {
      AppPrint.printError(">>>>>>>>>>Catch Exception in auth repository: $e");
      return NotSpecificFailure(message: e.toString());
    }
  }

  @override
  Future<Either<Failure, Success>> deleteCurrentUserAccount() => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> forgetPassword(ForgetPasswordRequest request) => throw UnimplementedError();

  @override
  Future<Either<Failure, User>> getCurrentUser() => throw UnimplementedError();

  @override
  Future<Either<Failure, User>> loginWithGoogle(LoginRequest request) => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> logout() => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> resetPassword(ResetPasswordRequest request) => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> sendEmailVerificationToken() => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> verifyEmail(String token) => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> verifyResetPasswordByEmailToken(VerifyResetPasswordTokenRequest request) => throw UnimplementedError();
}
