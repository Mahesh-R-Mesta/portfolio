import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolio/constant/color_constant.dart';

final ThemeData theme = ThemeData(
    fontFamily: 'ShantellSans',
    scaffoldBackgroundColor: Color(0xffF7F9FC),
    colorScheme: ColorScheme.light(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF50E3C2),
      surface: Color(0xFFFFFFFF),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFF1C1C1E),
    ),
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        textStyle: TextStyle(color: Colors.black, fontSize: 13)),
    textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        labelLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.black54),
        labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black54),
        titleLarge: TextStyle(color: const Color(0xFF1C1C1E), fontSize: 30.sp, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(color: const Color(0xFF1C1C1E), fontSize: 14.sp)),
    iconTheme: IconThemeData(color: ColorConst.darkGary));
