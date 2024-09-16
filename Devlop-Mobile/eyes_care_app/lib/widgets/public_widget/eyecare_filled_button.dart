import '../animation_widgets/scale_down_transition.dart';
import 'package:flutter/material.dart';

class EyeFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isShowleLoding;
  final double width;
  final Widget child;

  const EyeFilledButton({
    super.key,
    this.onPressed,
    required this.width,
    this.isShowleLoding = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleDownTransitionWidget(
      child: Container(
        decoration: buttonBoxDecoration(context),
        margin: const EdgeInsets.only(top: 16.0),
        width: width,
        height: 45,
        child: FilledButton(
            onPressed: onPressed,
            child: isShowleLoding
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : child),
      ),
    );
  }
}

BoxDecoration buttonBoxDecoration(BuildContext context,
    [String color1 = "", String color2 = ""]) {
  Color c1 = Theme.of(context).primaryColor;
  Color c2 = Theme.of(context).primaryColor;

  return BoxDecoration(
    boxShadow: const [
      BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 5.0)
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.0, 1.0],
      colors: [
        c1,
        c2,
      ],
    ),
    color: const Color.fromARGB(255, 52, 0, 143),
    borderRadius: BorderRadius.circular(10),
  );
}

class MyClass extends StatelessWidget {
  const MyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
