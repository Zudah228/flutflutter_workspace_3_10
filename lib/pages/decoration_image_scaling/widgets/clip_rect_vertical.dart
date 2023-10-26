import 'package:flutter/material.dart';

import './custom_sized_box.dart';

/// ウィジェットを縦に切り取り、切り取った分小さくする
class ClipRectVertical extends StatelessWidget {
  const ClipRectVertical({
    super.key,
    required this.vertical,
    required this.child,
  });

  final double vertical;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomSizedBox(
      additionalHeight: -vertical,
      child: ClipPath(
        clipper: VerticalClipper(vertical: vertical),
        child: child,
      ),
    );
  }
}

class VerticalClipper extends CustomClipper<Path> {
  VerticalClipper({super.reclip, required this.vertical});

  final double vertical;

  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(
        Rect.fromLTWH(
          0,
          vertical / 2,
          size.width,
          size.height - vertical,
        ),
      )
      ..close();
  }

  @override
  bool shouldReclip(covariant VerticalClipper oldClipper) {
    return vertical != oldClipper.vertical;
  }
}
