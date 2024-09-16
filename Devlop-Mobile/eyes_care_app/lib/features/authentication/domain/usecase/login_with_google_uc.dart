import 'package:dartz/dartz.dart';
import '../../../../core_api/error&success_abstracts/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import '../requests/login_request.dart';
class LoginWithGooglUseCase {
  final AuthRepository repository;

  LoginWithGooglUseCase(this.repository);

  Future<Either<Failure, User>> call(LoginRequest request) async {
    return await repository.loginWithGoogle(request);
  }
}
