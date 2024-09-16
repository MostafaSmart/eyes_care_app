import 'package:dartz/dartz.dart';
import 'package:eyes_care_app/features/posts/domain/entities/post.dart';


import '../../../../core_api/error&success_abstracts/failures.dart';
import '../repositories/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository repository;

  UpdatePostUseCase(this.repository);
  Future<Either<Failure, void>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
