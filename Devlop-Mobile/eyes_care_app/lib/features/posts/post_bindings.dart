import 'package:eyes_care_app/core/helper/app_print_class.dart';

import 'package:eyes_care_app/features/posts/presentaion/getx/post_controller.dart';
import 'package:get/get.dart';

import 'data/repositories/post_repository_impl.dart';
import 'domain/usecase/get_all_post.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    AppPrint.printInfo("Stat Injection The Controllers post");
    //=============================== Stat Injection The Controllers ======================================
    Get.lazyPut(() => PostController(), fenix: true);
//=============================== End Injection The Controllers ======================================
//
//
//=============================== Stat Injection The UseCase ======================================
    Get.lazyPut(() => PostRepositoryImpl(), fenix: true);
    Get.lazyPut(() => GetAllPostsUseCase(Get.find<PostRepositoryImpl>()),
        fenix: true);

//=============================== End Injection The UseCase ======================================
  }
}
