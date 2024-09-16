import 'package:eyes_care_app/features/authentication/presentaion/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/helper/validations.dart';
import '../../../../localization/app_localization.dart';
import '../widget/header_auth.dart';
import '../../../../widgets/public_widget/eyecare_filled_button.dart';
import '../../../../widgets/public_widget/eyecare_img_logo.dart';
import '../../../../widgets/public_widget/eyecare_text.dart';
import '../../../../widgets/public_widget/eyecare_textformfield.dart';
import '../widget/continue_with.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //headerAuth
            const SizedBox(
              height: 150,
              child: AuthHeaderWidget(130),
            ),

            // logo app eyes_care
            const EyeCareImageLogo(),

            // text temporary
            const EyeCareText(
              text: "العنايةبالعين",
              fontsize: 25,
            ),

            SizedBox(height: screenHeight * 0.01),

            // register form
            Form(
              key: controller.registerFormKey,
              child: Column(
                children: [
                  // email field
                  EyeCareTextFormFiled(
                    margin: const EdgeInsets.only(bottom: 16),
                    controller: controller.emailController,
                    textInputType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    hintText: AppLocalization.email.tr,
                    validator: (value) {
                      return Validations.emailValidator(value?.trim());
                    },
                  ),
                  // name field
                  EyeCareTextFormFiled(
                    margin: const EdgeInsets.only(bottom: 16),
                    controller: controller.nameController,
                    textInputType: TextInputType.name,
                    icon: Icons.person_outline_outlined,
                    hintText: AppLocalization.name.tr,
                    validator: (value) {
                      return Validations.emptyValidator(value?.trim());
                    },
                  ),

                  // password fields
                  Obx(() => passwordFiled()),
                ],
              ),
            ),

            // Sign up button
            Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: controller.isLoading.value ? 90 : screenWidth - 40,
                child: EyeFilledButton(
                  isShowleLoding: controller.isLoading.value,
                  width: controller.width.value,
                  child: Text(AppLocalization.login.tr),
                  onPressed: () => controller.register(),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            // continue with google, face
            const ContinueWithWidget(
              isRegister: true,
            ),

            // create account
            const SignInWidget(),
          ],
        ),
      ),
    );
  }

  Widget passwordFiled() {
    return Column(
      children: [
        EyeCareTextFormFiled(
          margin: const EdgeInsets.only(bottom: 16),
          controller: controller.passwordController,
          obscureText: !controller.isPassVisible.value,
          suffixIcon: controller.isPassVisible.value
              ? const Icon(
                  Icons.visibility_outlined,
                )
              : const Icon(
                  Icons.visibility_off_outlined,
                ),
          onSuffixIconPressed: () => controller.changePasswordVisible(),
          textInputType: TextInputType.visiblePassword,
          icon: Icons.lock_outline,
          hintText: AppLocalization.password.tr,
          validator: (value) {
            return Validations.passwordValidator(value?.trim());
          },
        ),

        // confirm password field
        EyeCareTextFormFiled(
          controller: controller.conPassController,
          obscureText: !controller.isPassVisible.value,
          suffixIcon: controller.isPassVisible.value
              ? const Icon(
                  Icons.visibility_outlined,
                )
              : const Icon(
                  Icons.visibility_off_outlined,
                ),
          onSuffixIconPressed: () => controller.changePasswordVisible(),
          textInputType: TextInputType.visiblePassword,
          icon: Icons.lock_outline,
          hintText: AppLocalization.confirmPassword.tr,
          validator: (value) {
            return Validations.passwordValidator(value?.trim(),
                confirmPass: controller.passwordController.text);
          },
        ),
      ],
    );
  }
}

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalization.alreadyHaveAcc.tr,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            AppLocalization.signIn.tr,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
