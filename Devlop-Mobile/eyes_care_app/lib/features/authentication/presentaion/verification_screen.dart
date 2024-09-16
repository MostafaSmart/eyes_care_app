import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../localization/app_localization.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpFieldWidth = max(40.0, Get.width * 1 / 7);

    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          SizedBox(height: Get.height * 0.02),
          Text(
            AppLocalization.phoneVerification.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 30),

          const Text("show message", textAlign: TextAlign.center),

          // token fields
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Flexible(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: OtpTextField(
                          clearText: true,
                          focusedBorderColor: Theme.of(context).primaryColor,
                          fieldWidth: min(80, otpFieldWidth),
                          cursorColor: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          numberOfFields: 5,
                          borderColor: Theme.of(context).primaryColor,
                          showFieldAsBox: true,
                          autoFocus: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {},
                          //runs when every textfield is filled

                          //  (String verificationCode) async {
                          //   await verifyCodeFunction(verificationCode);
                          //   // Get.toNamed(ScreensRoutes.resetPasswordScreen);
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // resend code button
          const SizedBox(height: 20),
          // Obx(
          //   () {
          //     RxInt remainingSeconds = controller.remainingSeconds;
          //     if (remainingSeconds.value <= 0) {
          //       return TextButton(
          //         onPressed: () => controller.resendCode(resendCodeFunction),
          //         child: Text(AppLocalization.resendCode.tr),
          //       );
          //     } else {
          //       return Text(
          //         "${AppLocalization.resendCodeAfter.tr} ${remainingSeconds.value} ${AppLocalization.seconds.tr}",
          //         style: Theme.of(context).textTheme.bodySmall,
          //         textAlign: TextAlign.center,
          //       );
          //     }
          //   },
          // ),
        ],
      ),
 
    );
  }
}
