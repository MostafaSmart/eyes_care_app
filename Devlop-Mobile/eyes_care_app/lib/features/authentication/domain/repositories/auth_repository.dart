import 'package:dartz/dartz.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/login_request.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/register_user_request.dart';

import '../../../../core_api/error&success_abstracts/failures.dart';
import '../../../../core_api/error&success_abstracts/success.dart';
import '../entities/user.dart';
import '../requests/reset_password_request.dart';

abstract class AuthRepository {
  /// اذا غيرنا فايريس الخاص به token تسجيل الدخول للمستخدم مع الاحتفاظ بالـ
  Future<Either<Failure, User>> loginWithEmail(LoginRequest request);
  Future<Either<Failure, User>> loginWithGoogle(LoginRequest request);
  Future<Either<Failure, User>> registerWithEmail(RegisterUserRequest request);
  Future<Either<Failure, User>> registerWithGoogle(RegisterUserRequest request);
  Future<Either<Failure, Success>> logout();
  /// function used to get current user data (by parier token)
  Future<Either<Failure, User>> getCurrentUser();

  /// function used to delete current user account (by parier token)
  Future<Either<Failure, Success>> deleteCurrentUserAccount();

  /// function used to verify user email (by parier token)
  Future<Either<Failure, Success>> sendEmailVerificationToken();

  /// functio used to check the validation of email token
  Future<Either<Failure, Success>> verifyEmail(String token);

  /// ارسال طلب بتغيير كلمة السر وبناء عليه سيتم ارسال الكود الى الايميل
  Future<Either<Failure, Success>> forgetPassword(
      ForgetPasswordRequest request);

  Future<Either<Failure, Success>> verifyResetPasswordByEmailToken(
      VerifyResetPasswordTokenRequest request);

  Future<Either<Failure, Success>> resetPassword(ResetPasswordRequest request);
}
