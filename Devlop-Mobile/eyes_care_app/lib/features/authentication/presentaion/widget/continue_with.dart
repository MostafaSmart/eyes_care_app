import 'package:eyes_care_app/core/constants/app_images.dart';
import '../../../../core/services/google_signin_services.dart';
import '/localization/app_localization.dart';
import '../../../../widgets/public_widget/eyecare_social_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContinueWithWidget extends StatelessWidget {
  final bool isRegister;
  const ContinueWithWidget({super.key, this.isRegister = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text(
                      isRegister
                          ? AppLocalization.orRegisterWith.tr
                          : AppLocalization.orLoginWith.tr,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await GoogleSignInService().handleSignIn();
                   
                  },
                  child: SocialIcons(
                    widget: SvgPicture.asset(
                      "${AppImages.pathIcons}google.svg",
                    ),
                  ),
                ),
                SocialIcons(
                  widget: Image.asset(
                    "${AppImages.pathImages}fac.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
