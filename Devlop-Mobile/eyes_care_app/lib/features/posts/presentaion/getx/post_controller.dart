import 'package:eyes_care_app/core/helper/app_print_class.dart';
import 'package:eyes_care_app/core/util/app_util.dart';
import 'package:eyes_care_app/features/posts/domain/usecase/get_all_post.dart';
import 'package:get/get.dart';
import '../../domain/entities/post.dart';

class PostController extends GetxController {
  RxDouble minWidth = 267.0.obs;
  RxList<Post> allPosts = <Post>[].obs;
  RxBool isLoading = RxBool(false);

  Future<void> getAllPosts() async {
    isLoading.value = true;
    GetAllPostsUseCase getAllPostsUseCase = Get.find();
    (await getAllPostsUseCase()).fold(
      (failure) => {
        AppUtil.showMessage(failure.message),
      },
      (post) {
        allPosts.value = post;
      },
    );
    isLoading.value = false;
  }

  @override
  void onInit() {
    // AppPrint.printInfo("---------------------------------------------------");
    AppPrint.printInfo(
        "Stat Injection The Controllers post------------------------");
    super.onInit();
    getAllPosts();
  }
}
