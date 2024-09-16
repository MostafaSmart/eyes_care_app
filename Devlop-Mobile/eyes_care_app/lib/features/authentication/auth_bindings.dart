import 'package:eyes_care_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:eyes_care_app/features/authentication/domain/usecase/login_with_email.dart';
import 'package:eyes_care_app/features/authentication/presentaion/register/register_controller.dart';
import 'package:get/get.dart';
import 'presentaion/login/login_controller.dart';
import 'presentaion/password/forget_password_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    //=============================== Stat Injection The Controllers ======================================
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);

//=============================== End Injection The Controllers ======================================
//
//
//=============================== Stat Injection The UseCase ======================================
    Get.lazyPut(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut(() => LoginWithEmailUseCase(Get.find<AuthRepositoryImpl>()),
        fenix: true);
//=============================== End Injection The UseCase ======================================
  }
}
