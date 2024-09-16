import 'package:flutter/material.dart';

class ContainerShape extends StatelessWidget {
  const ContainerShape(
      {super.key, required this.width, required this.color, this.isDir});
  final double width;
  final Color color;
  final bool? isDir;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      width: width,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: isDir ?? true
            ? const BorderRadius.only(
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
      ),
    );
  }
}
