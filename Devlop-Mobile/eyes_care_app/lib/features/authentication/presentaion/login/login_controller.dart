import 'package:eyes_care_app/app.dart';
import 'package:eyes_care_app/core/util/app_util.dart';
import 'package:eyes_care_app/features/authentication/domain/requests/login_request.dart';
import 'package:eyes_care_app/features/authentication/domain/usecase/login_with_email.dart';
import 'package:eyes_care_app/features/posts/post_bindings.dart';
import 'package:eyes_care_app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool isPassVisible = false.obs;
  RxBool isLoading = false.obs;
  RxDouble width = 100.0.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void changePasswordVisible() {
    isPassVisible.value = !isPassVisible.value;
  }

  void login() async {
    Get.focusScope?.unfocus();
    // if (!(loginFormKey.currentState?.validate() ?? true)) return;
    isLoading.value = true;
    LoginWithEmailUseCase loginWithEmailUseCase = Get.find();
    LoginRequest request = LoginRequest.withEmail(
      password: passwordController.text.trim(),
      email: emailController.text.trim(),
    );
    (await loginWithEmailUseCase.call(request)).fold(
      (failure) {
        AppUtil.showMessage(failure.message);
      },
      (user) {
        AppUtil.showMessage(AppLocalization.successLogin);
        Get.off(
          () => const MainScreen(),
          binding: PostBinding(),
        );
      },
    );
    
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
}
