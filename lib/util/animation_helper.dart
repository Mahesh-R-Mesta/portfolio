import 'dart:math';

import 'package:flutter/widgets.dart';

class AnimationHelper {
  static double scrollPortion(ScrollController controller, double position, double move) => ((controller.offset - position) / move).clamp(0, 1);

  static AlwaysStoppedAnimation<double> square(double value) => AlwaysStoppedAnimation(pow(value * 10, 2) / pow(10, 2));

  static AlwaysStoppedAnimation<double> exponent(double value) => AlwaysStoppedAnimation(exp(value * 10) / exp(10));
}
