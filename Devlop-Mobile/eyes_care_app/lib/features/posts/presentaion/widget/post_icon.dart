import 'package:flutter/material.dart';

class IconPost extends StatelessWidget {
  const IconPost({
    super.key,
    this.color,
    required this.icon,
  });
  final Color? color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: Icon(icon, size: 12, color: Colors.white),
    );
  }
}
