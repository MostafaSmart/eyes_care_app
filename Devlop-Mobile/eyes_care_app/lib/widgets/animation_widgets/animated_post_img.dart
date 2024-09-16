import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedPostDetailsPage extends StatelessWidget {
  final int index;
  final ValueNotifier<Offset> _offsetNotifier = ValueNotifier(Offset.zero);
  final ValueNotifier<double> _scaleNotifier = ValueNotifier(1.0);
  final double _threshold = 100.0; // عتبة السحب للخروج
  final Widget childButtons;
  // final String pathImg;

  AnimatedPostDetailsPage({
    super.key,
    required this.index,
    required this.childButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              _offsetNotifier.value = Offset(_offsetNotifier.value.dx,
                  _offsetNotifier.value.dy + details.primaryDelta!);
            },
            onVerticalDragEnd: (details) {
              if (_offsetNotifier.value.dy.abs() > _threshold) {
                Navigator.pop(context);
              } else {
                _offsetNotifier.value = Offset.zero;
              }
            },
            onScaleStart: (details) => _scaleNotifier.value = 1.0,
            onScaleUpdate: (details) => _scaleNotifier.value = details.scale,
            child: Center(
              child: ValueListenableBuilder<Offset>(
                valueListenable: _offsetNotifier,
                builder: (context, offset, child) {
                  return ValueListenableBuilder<double>(
                    valueListenable: _scaleNotifier,
                    builder: (context, scale, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5 *
                                  (offset.dy.abs() / _threshold).clamp(0.0, 1.0),
                              sigmaY: 5 *
                                  (offset.dy.abs() / _threshold).clamp(0.0, 1.0),
                            ),
                            child: Container(
                              color: Colors.black.withOpacity(
                                0.5 *
                                    (offset.dy.abs() / _threshold)
                                        .clamp(0.0, 1.0),
                              ),
                            ),
                          ),
                          Hero(
                            tag: 'imageTag_$index',
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              transform: Matrix4.translationValues(
                                  offset.dx, offset.dy, 0)
                                ..scale(scale),
                              child: Image.asset("assets/images/post.jpg",
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          childButtons,
         
        ],
      ),
    );
  }
}
