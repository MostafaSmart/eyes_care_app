import 'package:eyes_care_app/features/authentication/presentaion/password/forget_password_controller.dart';
import 'package:eyes_care_app/localization/app_localization.dart';
import 'package:eyes_care_app/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/helper/validations.dart';
import '../../../../widgets/public_widget/eyecare_filled_button.dart';
import '../../../../widgets/public_widget/eyecare_textformfield.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),

            Text(
              textAlign: TextAlign.center,
              AppLocalization.checkEmail.tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 15),

            Text(
              AppLocalization.enterYourEmailForOpt.tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: screenHeight * 0.02),

            SizedBox(
              height: 200,
              width: 270,
              child: Image.asset("${AppImages.pathImages}rest.jpg"),
            ),

            Form(
              // key: controller.loginFormKey,
              child: Center(
                child: EyeCareTextFormFiled(
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  hintText: AppLocalization.email.tr,
                  validator: (value) {
                    return Validations.passwordValidator(value?.trim());
                  },
                ),
              ),
            ),

            Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: controller.isLoading.value ? 90 : screenWidth - 40,
                child: EyeFilledButton(
                  isShowleLoding: false,
                  width: double.infinity,
                  child: Text(AppLocalization.next.tr),
                  onPressed: () =>
                      Get.offNamed(ScreenRoutes.verificationScreen),
                ),
              ),
            ),

         
          ],
        ),
      ),
    );
  }
}
