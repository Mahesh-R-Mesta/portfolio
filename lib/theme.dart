import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolio/util/constant/color_constant.dart';

final ThemeData theme = ThemeData(
    fontFamily: 'ShantellSans',
    scaffoldBackgroundColor: Color(0xffF7F9FC),
    appBarTheme: AppBarTheme(backgroundColor: Color(0xffF7F9FC), toolbarHeight: 50),
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
        textStyle: TextStyle(color: Colors.black, fontSize: 10)),
    textTheme: TextTheme(
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black54),
        labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
        titleLarge: TextStyle(color: const Color(0xFF1C1C1E), fontSize: 30, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(color: const Color(0xFF1C1C1E), fontSize: 14)),
    iconTheme: IconThemeData(color: ColorConst.darkGary));
