import 'package:flutter/material.dart';
import 'package:myportfolio/ui/home.dart';
// import 'package:myportfolio/ui/splash_screen.dart';

class RouteService {
  static const String INITIAL = "/home";
  static const String LOADING = "/loading";

  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case INITIAL:
        {
          return PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
            return HomePage();
          });
        }
      // case LOADING:
      //   {
      //     return PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
      //       return LoadingScreen();
      //     });
      //   }
      // case Experience.name:
      //   {
      //     return PageRouteBuilder(
      //         transitionDuration: const Duration(milliseconds: 500),
      //         pageBuilder: (ctx, animation1, animation2) {
      //           return Experience();
      //         });
      //   }
    }
    return null;
  }
}
