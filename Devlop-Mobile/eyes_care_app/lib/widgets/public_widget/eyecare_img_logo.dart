import 'package:eyes_care_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class EyeCareImageLogo extends StatelessWidget {
  const EyeCareImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 270,
      child: Image.asset(
        "${AppImages.pathImages}eyecare_logo_cat.png",
      ),
    );
  }
}
