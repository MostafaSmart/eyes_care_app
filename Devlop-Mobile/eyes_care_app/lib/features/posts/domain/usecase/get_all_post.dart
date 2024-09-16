import 'package:dartz/dartz.dart';

import '../../../../core_api/error&success_abstracts/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetAllPostsUseCase {
  final PostRepository repository;

  GetAllPostsUseCase(this.repository);
  Future<Either<Failure, List<Post>>> call() {
    return repository.getAllPosts();
  }
}
