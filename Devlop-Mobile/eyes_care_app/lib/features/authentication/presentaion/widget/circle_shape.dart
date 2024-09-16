import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'on_boarding/shape_circle.dart';

class CustomCircleShape extends StatelessWidget {
  final double sizeHeigthPercentage;
  final bool isTopOrdown;

  const CustomCircleShape({
    super.key,
    required this.sizeHeigthPercentage,
    required this.isTopOrdown,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * sizeHeigthPercentage, // 0.05,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: isTopOrdown ? -90 : null,
            right: isTopOrdown ? null : -80,
            top: isTopOrdown ? 0 : 40,
            child: const CircleShape(
              radius: 80,
              isTopOrdown: true,
            ),
          ),
        ],
      ),
    );
  }
}
