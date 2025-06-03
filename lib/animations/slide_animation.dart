import 'package:flutter/material.dart';
import 'package:myportfolio/util/animation_helper.dart';

class CustomSlideFadeAnimation extends StatelessWidget {
  final Widget child;
  final ScrollController controller;
  final double position;
  final double range;
  final double translate;
  final AxisDirection direction;
  final AlwaysStoppedAnimation<double> Function(double value)? fadeCurve;
  const CustomSlideFadeAnimation(
      {super.key,
      required this.child,
      required this.controller,
      required this.position,
      required this.range,
      this.direction = AxisDirection.left,
      this.fadeCurve,
      this.translate = 300});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (ctx, child) {
          final value = AnimationHelper.scrollPortion(controller, position, range);
          Offset offset = Offset(translate - (value * translate), 0);
          if (direction == AxisDirection.left) {
            offset = Offset(translate - (value * translate), 0);
          } else if (direction == AxisDirection.right) {
            offset = Offset(-translate + (value * translate), 0);
          } else if (direction == AxisDirection.down) {
            offset = Offset(0, -translate + (value * translate));
          } else if (direction == AxisDirection.up) {
            offset = Offset(0, translate - (value * translate));
          }
          return FadeTransition(
              opacity: fadeCurve?.call(value) ?? AlwaysStoppedAnimation(value), child: Transform.translate(offset: offset, child: child!));
        },
        child: child);
  }
}
