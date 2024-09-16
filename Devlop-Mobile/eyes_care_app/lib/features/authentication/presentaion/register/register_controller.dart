import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController conPassController;
  RxBool isPassVisible = false.obs;
  RxBool isLoading = false.obs;
  RxDouble width = 100.0.obs;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  void changePasswordVisible() {
    isPassVisible.value = !isPassVisible.value;
  }

  Future<void> register() async {
    isLoading.value = true;
    await Future.delayed(
        const Duration(seconds: 2)); //
    isLoading.value = false;
    if (!(registerFormKey.currentState?.validate() ?? true)) return;
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    conPassController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
