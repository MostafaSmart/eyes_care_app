import 'package:flutter/material.dart';

class CircleShape extends StatelessWidget {
  const CircleShape({
    super.key,
    required this.radius,
    this.isTopOrdown,
    this.color,
  });

  final double radius;
  final bool? isTopOrdown;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color ??
          (isTopOrdown!
              ? const Color.fromARGB(48, 35, 92, 117)
              : const Color.fromARGB(116, 35, 92, 117)),
    );
  }
}
