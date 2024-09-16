import 'dart:convert';

import 'package:eyes_care_app/core/helper/app_print_class.dart';
import 'package:eyes_care_app/features/posts/data/models/pos_model.dart';
import 'package:hive/hive.dart';

class PostsBox {
  static const String boxKey = "postsBox";
  static const String postsList = "postsList";
  static const String lastUpdatedAt = "lastUpdatedAt";

  static Future<void> setAllPosts(List<PostModel> posts) async {
    AppPrint.printInfo(posts.toString());
    final postBox = Hive.box(PostsBox.boxKey);
    final postsData = posts
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    await postBox.put(PostsBox.postsList, json.encode(postsData));
  }

  static List<PostModel> getAllPost() {
    final box = Hive.box(PostsBox.boxKey);
    final jsonData = box.get(PostsBox.postsList);
    if (jsonData is String) {
      var postsJson = jsonDecode(jsonData);
      List<PostModel> postModels = postsJson
          .map<PostModel>(
              (json) => PostModel.fromJson(Map<String, dynamic>.from(json)))
          .toList();
          AppPrint.printInfo( postModels.toString());
      return postModels;
    } else {
      throw Exception(' ${jsonData.runtimeType}');
    }
  }
}
  // AppPrint.printInfo(jsonData.toString());
  //     List<PostModel> postModels = jsonData
  //         .map<PostModel>(
  //             (json) => PostModel.fromJson(Map<String, dynamic>.from(json)))
  //         .toList();
  //     return postModels;
