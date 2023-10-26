import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 指定したサイズ分ウィジェットの layout を変化させる
class CustomSizedBox extends SingleChildRenderObjectWidget {
  const CustomSizedBox({
    super.key,
    required this.additionalHeight,
    super.child,
  });

  final double additionalHeight;

  @override
  CustomRenderPositionedBox createRenderObject(BuildContext context) {
    return CustomRenderPositionedBox(
      additionalHeight: additionalHeight,
      textDirection: Directionality.maybeOf(context),
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    CustomRenderPositionedBox renderObject,
  ) {
    renderObject
      ..additionalHeight = additionalHeight
      ..textDirection = Directionality.maybeOf(context);
  }
}

class CustomRenderPositionedBox extends RenderAligningShiftedBox {
  CustomRenderPositionedBox({
    required super.textDirection,
    required this.additionalHeight,
  });

  double additionalHeight;

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    final bool shrinkWrapWidth = constraints.maxWidth == double.infinity;
    final bool shrinkWrapHeight = constraints.maxHeight == double.infinity;

    if (child != null) {
      child!.layout(constraints.loosen(), parentUsesSize: true);
      size = constraints.constrain(
        Size(
          shrinkWrapWidth ? child!.size.width : double.infinity,
          shrinkWrapHeight
              ? child!.size.height + additionalHeight
              : double.infinity,
        ),
      );
      alignChild();
    } else {
      size = constraints.constrain(
        Size(
          shrinkWrapWidth ? 0.0 : double.infinity,
          shrinkWrapHeight ? 0.0 : double.infinity,
        ),
      );
    }
  }

  @override
  int get hashCode => Object.hash(super.hashCode, additionalHeight);

  @override
  bool operator ==(Object other) {
    return super == other &&
        other is CustomRenderPositionedBox &&
        other.additionalHeight == additionalHeight;
  }
}
