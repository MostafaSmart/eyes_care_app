import '../animation_widgets/scale_down_transition.dart';
import 'package:flutter/material.dart';

class EyeCareTextButton extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final void Function() onTap;
  final String text;
  final Color? color;
  final double? width;
  final double? height;

  const EyeCareTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.width,
    this.height,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleDownTransitionWidget(
      child: Container(
        height: height,
        alignment: alignment,
        width: width,
        child: TextButton(
          onPressed: onTap,
          child: Text(text),
        ),
      ),
    );
  }
}
