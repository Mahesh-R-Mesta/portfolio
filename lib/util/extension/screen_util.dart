import 'package:flutter/material.dart';

extension ScreenUtil on double {
  double get px {
    final screenWidth = MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    return (this / 375) * screenWidth; // Assuming 375 is the base width for design
  }

  double get rpx {
    final screenHeight = MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
    return (this / 667) * screenHeight; // Assuming 667 is the base height for design
  }
}
