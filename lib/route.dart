import 'package:flutter/material.dart';
import 'package:myportfolio/ui/about.dart';
import 'package:myportfolio/ui/experiance.dart';
import 'package:myportfolio/ui/home.dart';

class RouteService {
  static const String INITIAL = "/home";

  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case INITIAL:
        {
          return PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
            return HomePage();
          });
        }
      // case AboutPage.name:
      //   {
      //     return PageRouteBuilder(
      //         transitionDuration: const Duration(milliseconds: 500),
      //         pageBuilder: (ctx, animation1, animation2) {
      //           return AboutPage();
      //         });
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
