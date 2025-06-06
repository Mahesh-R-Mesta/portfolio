import 'package:flutter/material.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/ui/home.dart';
import 'package:myportfolio/ui/certificate/certificate_view.dart' deferred as certificate;
import 'package:myportfolio/ui/project/more_project.dart' deferred as moreProjects;
import 'package:myportfolio/util/widget/differ_load.dart';

import 'package:myportfolio/ui/project/project_detail.dart'; //deferred as project_detail;

class RouteService {
  static const String INITIAL = "/home";
  static const String certificateView = "/certificate_view";
  static const String projectDetail = "/project_detail";
  static const String seeMoreProject = "/see_more_project";

  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case INITIAL:
        {
          return PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
            return HomePage();
          });
        }
      case certificateView:
        {
          final image = setting.arguments as String;
          return PageRouteBuilder(
              fullscreenDialog: true,
              barrierColor: Colors.black.withAlpha(125),
              pageBuilder: (ctx, _, __) {
                return DifferLoad(
                    future: certificate.loadLibrary(),
                    builder: (context) {
                      return certificate.CertificateView(image: image);
                    });
              });
        }

      case projectDetail:
        {
          final project = setting.arguments as Project;
          return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (ctx, _, __) {
                return ProjectDetail(project: project);
                // return DifferLoad(future: project_detail.loadLibrary(), builder: (ctx) => project_detail.ProjectDetail(project: project));
              });
        }
      case seeMoreProject:
        {
          return PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (ctx, _, __) {
                return DifferLoad(future: moreProjects.loadLibrary(), builder: (ctx) => moreProjects.MoreProjects());
              });
        }
    }
    return null;
  }
}
