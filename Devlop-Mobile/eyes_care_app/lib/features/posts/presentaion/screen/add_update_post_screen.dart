import 'package:eyes_care_app/widgets/public_widget/eyecare_filled_button.dart';
import 'package:eyes_care_app/localization/app_localization.dart';
import 'package:eyes_care_app/widgets/eyecare_button_icon.dart';
import 'package:eyes_care_app/widgets/public_widget/eyecare_img_logo.dart';
import 'package:eyes_care_app/widgets/public_widget/eyecare_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/presentaion/widget/circle_shape.dart';

class AddUpdatePostScreen extends StatelessWidget {
  const AddUpdatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBarCreatPost(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EyeCareImageLogo(),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                maxLines: 7,
                maxLength: 3,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 237, 236, 236),
                  filled: true,
                  hintText: AppLocalization.whatsonYourMind.tr,
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 18.0),
              ),
              EyeFilledButton(
                width: screenwidth,
                onPressed: () {},
                isShowleLoding: false,
                child: EyeCareTextIconHorizontal(
                  icon: Icons.photo,
                  text: AppLocalization.addPhoto.tr,
                ),
              ),
              const CustomCircleShape(
                isTopOrdown: false,
                sizeHeigthPercentage: 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget? appBarCreatPost() {
  return AppBar(
    title: EyeCareText(
      fontsize: 18,
      text: AppLocalization.createPost.tr,
      color: Colors.black,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 10),
        child: EyeFilledButton(
          width: 75,
          child: EyeCareText(
            fontsize: 13,
            text: AppLocalization.post.tr,
            color: Colors.white,
          ),
        ),
      ),
    ],
    elevation: 1.0,
  );
}
