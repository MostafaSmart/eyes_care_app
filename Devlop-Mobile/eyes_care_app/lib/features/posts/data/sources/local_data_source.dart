import 'package:eyes_care_app/core/hive_boxes/posts_box.dart';

import '../models/pos_model.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<void> cachePosts(List<PostModel> postModels);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> cachePosts(List<PostModel> postModels) async {
    await PostsBox.setAllPosts(postModels);
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    return PostsBox.getAllPost();
  }
}
