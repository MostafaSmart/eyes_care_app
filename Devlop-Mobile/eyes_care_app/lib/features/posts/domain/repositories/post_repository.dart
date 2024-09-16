import 'package:dartz/dartz.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/success.dart';

import '../../../../core_api/error&success_abstracts/failures.dart';
import '../entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  
  Future<Either<Failure,Success>> updatePost(Post post);
  Future<Either<Failure, Success>> deletePost(int id);
  Future<Either<Failure, Success>> addPost(Post post);
}
