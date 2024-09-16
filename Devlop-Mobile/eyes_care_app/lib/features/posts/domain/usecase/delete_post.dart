import 'package:dartz/dartz.dart';
import '../../../../core_api/error&success_abstracts/failures.dart';
import '../repositories/post_repository.dart';
class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase(this.repository);
  
  Future<Either<Failure, void>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
