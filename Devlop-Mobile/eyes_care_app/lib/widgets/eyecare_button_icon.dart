import 'package:flutter/material.dart';

import 'public_widget/eyecare_text.dart';

TextButton elevatedButtonIconCustom(
    Function() func, String text, IconData icon) {
  return TextButton.icon(
    onPressed: func,
    icon: Icon(icon),
    label: Text(text),
  );
}

class EyeCareTextIconHorizontal extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final IconData icon;
  final String text;
  final Color? colorText;
  final double? fontSize;

  const EyeCareTextIconHorizontal({
    super.key,
    required this.icon,
    required this.text,
    this.mainAxisAlignment,
    this.colorText,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(
          width: 3,
        ),
        EyeCareText(
          text: text,
          fontsize: fontSize ?? 16,
          color: colorText ?? Colors.white,
        )
      ],
    );
  }
}
