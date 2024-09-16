import 'package:eyes_care_app/features/posts/domain/entities/post.dart';
import 'package:eyes_care_app/features/posts/presentaion/getx/post_controller.dart';
import 'package:eyes_care_app/features/posts/presentaion/screen/add_update_post_screen.dart';
import 'package:eyes_care_app/features/posts/presentaion/widget/post_icon.dart';
import 'package:eyes_care_app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/animation_widgets/animated_post_img.dart';
import '../../../../widgets/public_widget/eyecare_profile_with_name.dart';
import '../../../../widgets/public_widget/eyecare_text.dart';
import '../../../../widgets/public_widget/eyecare_text_button_icon.dart';

class PostListWidget extends GetView<PostController> {
  final List<Post> posts;

  const PostListWidget({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 100,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 10),
                child: IconButton(
                  onPressed: () => Get.to(() => const AddUpdatePostScreen()),
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.black,
                    size: 28,
                  ),
                )),
          ],
          title: Text(
            AppLocalization.eyesCare.tr,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildListItem(context, index),
            childCount: posts.length,
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EyeCareProfileAvatarWithName(
                  name: posts[index].name,
                  date: posts[index].date,
                  pathImg: 'assets/images/post.jpg',
                ),
                EyeCareText(
                  text: posts[index].content!,
                  fontsize: 15,
                  textOverflow: TextOverflow.visible,
                  color: Colors.grey[800],
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 100),
                  pageBuilder: (context, __, ___) => AnimatedPostDetailsPage(
                    index: index,
                    childButtons: _buildChildButtons(context),
                  ),
                  transitionsBuilder: (_, animation, __, child) =>
                      FadeTransition(opacity: animation, child: child),
                ),
              );
            },
            child: Hero(
              tag: 'imageTag_$index',
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(posts[index].imageUrl!, fit: BoxFit.fill),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const IconPost(
                      icon: Icons.thumb_up, color: Colors.blue),
                  const IconPost(
                      icon: Icons.favorite, color: Colors.red),
                  const SizedBox(width: 5),
                  Text("${posts[index].likesCount}K",
                      style: TextStyle(fontSize: 12, color: Colors.grey[800])),
                ],
              ),
              Text('تعليق',
                  style: TextStyle(fontSize: 13, color: Colors.grey[800])),
            ],
          ),
          _buildChildButtons(context),
        ],
      ),
    );
  }
}

Widget _buildChildButtons(BuildContext context) {
  final bool isSmallWidth = MediaQuery.of(context).size.width <= 284;
  final double fontSize = MediaQuery.of(context).size.width >= 286 ? 12 : 10;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      EyeCareTextButtonIcon(
        onPressed: () => {},
        icon: Icons.thumb_up,
        text: isSmallWidth ? '' : AppLocalization.likes.tr,
        fontSize: fontSize,
        isActive: true,
      ),
      EyeCareTextButtonIcon(
        onPressed: () => {},
        icon: Icons.chat,
        text: isSmallWidth ? '' : 'نعليق',
        fontSize: fontSize,
      ),
      EyeCareTextButtonIcon(
        onPressed: () => {},
        icon: Icons.share,
        text: isSmallWidth ? '' : AppLocalization.share.tr,
        fontSize: fontSize,
      ),
    ],
  );
}
