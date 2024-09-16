import '../animation_widgets/scale_down_transition.dart';
import 'package:flutter/material.dart';

class SocialIcons extends StatelessWidget {
  final Widget widget;
  
  const SocialIcons({
    super.key,
    required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    return ScaleDownTransitionWidget(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0xff4CB9C0),
            ),
            BoxShadow(
              blurRadius: 1.0,
              color: Color(0xff4CB9C0),
            ),
          ],
        ),
        child: SizedBox(
          width: 50,
          height: 30,
          child: widget,
        ),
      ),
    );
  }
}
