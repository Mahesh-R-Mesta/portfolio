import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolio/route.dart';
import 'package:myportfolio/services/locator.dart';
import 'package:myportfolio/theme.dart';
import 'package:myportfolio/util/scroll_behaviour.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ScreenUtilInit(
    minTextAdapt: true,
    designSize: const Size(1280.0, 585.3),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      scrollBehavior: CustomScrollBehavior(),
      onGenerateRoute: RouteService.generateRoute,
      initialRoute: RouteService.INITIAL,
    ),
  ));
}
