import 'package:dartz/dartz.dart';
import 'package:eyes_care_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/register_user_request.dart';
import '../../../../core_api/error&success_abstracts/failures.dart';
import '../entities/user.dart';

class RegisterWithEmailUseCase {
  final AuthRepository repository;

  RegisterWithEmailUseCase(this.repository);
  Future<Either<Failure, User>> call(RegisterUserRequest request) async {
    return await repository.registerWithEmail(request);
  }
}
