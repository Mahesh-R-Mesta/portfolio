import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  Axis flexAxis() {
    final size = MediaQuery.of(this).size;
    if (size.width < 600) return Axis.vertical;
    return Axis.horizontal;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  bool get isPortrait {
    final width = MediaQuery.of(this).size.width;
    final orient = MediaQuery.of(this).orientation;
    return width < 600 && orient == Orientation.portrait;
  }

  double device(double landscape, double portrait) {
    if (MediaQuery.of(this).orientation == Orientation.landscape) {
      return landscape;
    } else if (MediaQuery.of(this).orientation == Orientation.portrait) {
      return portrait;
    }
    return portrait;
  }
}
