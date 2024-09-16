import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
      {super.key,
      required this.startText,
      required this.lasttText,
      this.fontSize});
  final String startText;
  final String lasttText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: const Color(0xff7195A4),
            fontSize: fontSize ?? 30,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: startText,
            ),
            TextSpan(
              text: lasttText,
              style: const TextStyle(
                color: Color.fromARGB(255, 9, 11, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
