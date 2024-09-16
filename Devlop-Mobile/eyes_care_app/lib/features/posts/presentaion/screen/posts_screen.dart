import 'package:eyes_care_app/features/posts/presentaion/getx/post_controller.dart';
import 'package:eyes_care_app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/post_list_widget.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.find();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => postController.getAllPosts(),
        child: Obx(() {
          if (postController.isLoading.value) {
            return const LoadingWidget();
          } else if (postController.allPosts.isNotEmpty) {
            return PostListWidget(posts: postController.allPosts);
          } else {
            return Center(child: Text(AppLocalization.thereISNoPosts.tr));
          }
        }),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
