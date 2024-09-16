import 'package:eyes_care_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class EyeCareText extends StatelessWidget {
  final TextAlign? textAlign;
  final TextOverflow textOverflow;
  final String text;
  final double fontsize;
  final Color? color;
 final FontWeight? fontWeight;

  const EyeCareText({
    super.key,
    required this.text,
    required this.fontsize,
    this.textAlign = TextAlign.center,
    this.color = const Color(AppColor.primaryColor),
    this.textOverflow = TextOverflow.visible,
     this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      // maxLines: 2,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
        height: 1.5,
      ),
    );
  }
}
