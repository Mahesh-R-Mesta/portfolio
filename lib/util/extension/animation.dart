import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension WidgetAnimation on Widget {
  Animate animateWith({List<Effect> effects = const [], bool autoPlay = true}) {
    return Animate(
      autoPlay: autoPlay,
      delay: const Duration(milliseconds: 100),
      effects: effects,
      child: this,
    );
  }
}
