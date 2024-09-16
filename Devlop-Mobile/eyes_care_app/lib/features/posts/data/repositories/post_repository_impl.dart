import 'package:dartz/dartz.dart';
import 'package:eyes_care_app/core/helper/app_print_class.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/exception.dart';
import 'package:eyes_care_app/core_api/error&success_abstracts/success.dart';

import 'package:eyes_care_app/features/posts/data/sources/local_data_source.dart';
import 'package:eyes_care_app/features/posts/domain/entities/post.dart';

import '../../../../core/util/app_util.dart';
import '../../../../core_api/error&success_abstracts/error_strings.dart';
import '../../../../core_api/error&success_abstracts/failures.dart';
import '../../../../core_api/network_info/network_info.dart';
import '../../domain/repositories/post_repository.dart';
import '../sources/remote_data_source.dart';

typedef DeleteOrUpdateOrAddPost = Future<void> Function();

class PostRepositoryImpl implements PostRepository {
  RemoteDataSource remoteDataSource = RemoteDataSourceImpl();
  LocalDataSource localDataSource = LocalDataSourceImpl();
  final NetworkInfo networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        AppPrint.printInfo(
            "?????????????????Before send request??????????????????????");
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        AppPrint.printInfo(
            "????????????????????Success status request???????????????????");
        return right(remotePosts);
      } on AppException catch (e) {
        return left(e.failure as ServerFailure);
      }
    } else {
      try {
        AppUtil.showMessage(ErrorString.OFFLINE_ERROR);
        final localPosts = await localDataSource.getCachedPosts();
        return right(localPosts);
      } on AppException {
        return left(EmptyCacheFailure(message: ErrorString.EMPTY_CACHE_ERROR));
      } catch (e) {
        return left(OfflineFailure(message: ErrorString.OFFLINE_ERROR));
      }
    }
  }

  @override
  Future<Either<Failure, Success>> addPost(Post post) => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> deletePost(int id) => throw UnimplementedError();

  @override
  Future<Either<Failure, Success>> updatePost(Post post) => throw UnimplementedError();

  // ignore: unused_element
  Future _handleErrors(Function registerFunc) async {
    try {
      if (await networkInfo.isConnected) {
        return await registerFunc();
      }
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
}
