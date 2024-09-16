import 'package:dartz/dartz.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/failures.dart';
import 'package:eyes_care_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/login_request.dart';

import '../entities/user.dart';

class LoginWithEmailUseCase {
  final AuthRepository repository;

  LoginWithEmailUseCase(this.repository);
  
  Future<Either<Failure, User>> call(LoginRequest request) async {
    return await repository.loginWithEmail(request);
  }
}
