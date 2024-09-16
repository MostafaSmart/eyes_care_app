import 'package:flutter/material.dart';

class EyeCareTextButtonIcon extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final Color? color;
  final String text;
  final double fontSize;
  final double? sizeIcon;
  final bool isActive;

  
  const EyeCareTextButtonIcon({
    super.key,
    this.isActive = false,
    required this.icon,
    required this.text,
    this.fontSize = 12.0,
    this.color = Colors.grey,
    this.sizeIcon = 17,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon,
            color: isActive ? Colors.blue : color,
            size: sizeIcon,
          ),
          label: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.blue : color,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
