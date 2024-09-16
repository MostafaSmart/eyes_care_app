import 'package:eyes_care_app/core/helper/app_print_class.dart';
import 'package:eyes_care_app/widgets/eyecare_button_icon.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/validations.dart';
import '../../../../localization/local_controller.dart';
import '../../../../screen_routes.dart';
import '../widget/header_auth.dart';
import '../../../../widgets/public_widget/choice_language.dart';
import 'login_controller.dart';
import '../../../../widgets/public_widget/eyecare_textformfield.dart';
import 'package:get/get.dart';
import '../../../../localization/app_localization.dart';
import '../../../../widgets/public_widget/eyecare_filled_button.dart';
import '../../../../widgets/public_widget/eyecare_textbutton.dart';
import '../../../../widgets/public_widget/eyecare_img_logo.dart';
import '../../../../widgets/public_widget/eyecare_text.dart';
import '../widget/continue_with.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppPrint.printInfo("-----------------LoginScreen----------------");

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
              child: AuthHeaderWidget(130),
            ),
            elevatedButtonIconCustom(
              () {
                final languageList = [
                  AppLocalization.arabic.tr,
                  AppLocalization.english.tr
                ];
                Get.bottomSheet(
                  enterBottomSheetDuration: const Duration(seconds: 0),
                  ChoiceLanguage(
                    initialSelectedIndex:
                        Get.locale?.languageCode == "en" ? 1 : 0,
                    languageList: languageList,
                    changeLang: (selectedIndex) {
                      AppLocallcontroller localController = Get.find();
                      Get.back();
                      controller.loginFormKey.currentState?.reset();

                      String selectedLanguageCode =
                          (selectedIndex == 0) ? 'ar' : 'en';

                      localController.changeLanguage(selectedLanguageCode);
                    },
                  ),
                );
              },
              Get.locale?.languageCode == 'en'
                  ? AppLocalization.english.tr
                  : AppLocalization.arabic.tr,
              Icons.arrow_drop_down_rounded,
            ),
            const EyeCareImageLogo(),
            const EyeCareText(
              text: "العنايةبالعين",
              fontsize: 30,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
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
                  Obx(
                    () => EyeCareTextFormFiled(
                      // margin: const EdgeInsets.only(bottom: 18),
                      textInputType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                      icon: Icons.lock_outline,
                      hintText: AppLocalization.password.tr,
                      obscureText: !controller.isPassVisible.value,
                      suffixIcon: controller.isPassVisible.value
                          ? Icon(
                              Icons.visibility_outlined,
                              color: Theme.of(context).primaryColor,
                            )
                          : Icon(
                              Icons.visibility_off_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                      onSuffixIconPressed: () =>
                          controller.changePasswordVisible(),
                      validator: (value) {
                        return Validations.passwordValidator(value?.trim());
                      },
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: controller.isLoading.value ? 90 : screenWidth - 40,
                child: EyeFilledButton(
                  isShowleLoding: controller.isLoading.value,
                  width: controller.width.value,
                  child: Text(AppLocalization.login.tr),
                  onPressed: () => controller.login(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EyeCareTextButton(
                  onTap: () => Get.toNamed(ScreenRoutes.forgetPasswordScreen),
                  text: AppLocalization.forgetPassword.tr,
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            const ContinueWithWidget(),
            SizedBox(height: screenWidth * 0.03),
            const SignupWidget(),
          ],
        ),
      ),
    );
  }
}

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalization.dontHaveAccount.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextButton(
              onPressed: () => Get.toNamed(ScreenRoutes.registerScreen),
              child: Text(
                AppLocalization.signUp.tr,
                style: const TextStyle(color: Color(0xff235C75)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
