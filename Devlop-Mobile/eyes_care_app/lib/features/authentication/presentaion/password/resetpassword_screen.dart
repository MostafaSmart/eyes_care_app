import 'package:eyes_care_app/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helper/validations.dart';
import '../../../../widgets/public_widget/eyecare_filled_button.dart';
import '../../../../widgets/public_widget/eyecare_textbutton.dart';
import '../../../../widgets/public_widget/eyecare_textformfield.dart';
import '../verification_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                textAlign: TextAlign.center,
                AppLocalization.resetYourPassword.tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalization.enterYourEmailForOpt.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: 200,
                  width: 270,
                  child: Image.asset("${AppImages.pathImages}for.jpg"
                      // "assets/images/2.png",
                      ) // SvgPicture.asset("assets/svg/done.svg"),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: EyeCareTextButton(
                      onTap: () => {},
                      // Get.toNamed(ScreenRoutes),
                      text: AppLocalization.forgetPassword.tr,
                      height: 50,
                    ),
                  )
                ],
              ),
              Form(
                // key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EyeCareTextFormFiled(
                      textInputType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      hintText: AppLocalization.email.tr,
                      validator: (value) {
                        return Validations.passwordValidator(value?.trim());
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    EyeCareTextFormFiled(
                      textInputType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                      hintText: AppLocalization.email.tr,
                      validator: (value) {
                        return Validations.passwordValidator(value?.trim());
                      },
                    ),
                  ],
                ),
              ),
              EyeFilledButton(
                isShowleLoding: false,
                width: Get.width,
                child: Text(AppLocalization.next.tr),
                // onPressed: () => Get.to(() => VerificationScreen()),
                onPressed: () => Get.to(() => const VerificationScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
