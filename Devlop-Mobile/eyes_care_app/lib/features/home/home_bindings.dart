import 'package:eyes_care_app/core/helper/app_print_class.dart';
import 'package:eyes_care_app/features/home/presentaion/getx/home_controller.dart';
import 'package:get/get.dart';

import '../posts/data/repositories/post_repository_impl.dart';
import '../posts/domain/usecase/get_all_post.dart';
import '../posts/presentaion/getx/post_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    AppPrint.printInfo("Stat Injection The Controllers home");
    //=============================== Stat Injection The Controllers ======================================
    Get.lazyPut(() => PostController(), fenix: true);
    Get.lazyPut(() => PostRepositoryImpl(), fenix: true);
    Get.lazyPut(() => GetAllPostsUseCase(Get.find<PostRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);

//=============================== End Injection The Controllers ======================================
//
//
//=============================== Stat Injection The UseCase ======================================

//=============================== End Injection The UseCase ======================================
  }
}
