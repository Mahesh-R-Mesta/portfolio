import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/constant/image_constant.dart';
import 'package:myportfolio/constant/string_constant.dart';

typedef TechStackData = ({
  double radius,
  double orbitRadius,
  double phase,
  String asset,
  String name,
  Animation<double>? anime,
});

class TechStackAnime extends StatefulWidget {
  const TechStackAnime({super.key});

  @override
  State<TechStackAnime> createState() => _TechStackAnimeState();
}

class _TechStackAnimeState extends State<TechStackAnime> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> firstOrbitAngle;
  late Animation<double> secondOrbitAngle;
  late Animation<double> thirdOrbitAngle;
  late List<TechStackData> techStacks;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    thirdOrbitAngle = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    secondOrbitAngle = Tween<double>(begin: 0, end: 4 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    firstOrbitAngle = Tween<double>(begin: 0, end: 8 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    techStacks = [
      (asset: ImageConst.uiUx, radius: 25, orbitRadius: 100, name: "UI/UX", phase: pi / 4, anime: firstOrbitAngle),
      (asset: ImageConst.swift, radius: 30, orbitRadius: 180, name: "Swift", phase: pi / 2, anime: secondOrbitAngle),
      (asset: ImageConst.api, radius: 25, orbitRadius: 100, name: "API INTEGRATION", phase: (pi * 3) / 4, anime: firstOrbitAngle),
      (asset: ImageConst.android, radius: 30, orbitRadius: 180, name: "ANDROID", phase: 0, anime: secondOrbitAngle),
      (asset: ImageConst.kotlin, radius: 30, orbitRadius: 180, name: "KOTLIN", phase: pi, anime: secondOrbitAngle),
      (asset: ImageConst.firebase, radius: 25, orbitRadius: 100, name: "Firebase", phase: pi + (pi / 4), anime: firstOrbitAngle),
      (asset: ImageConst.java, radius: 30, orbitRadius: 180, name: "Java", phase: pi + (pi / 2), anime: secondOrbitAngle),
      (asset: ImageConst.dart, radius: 25, orbitRadius: 100, name: "Dart", phase: pi + (pi * 3 / 4), anime: firstOrbitAngle),
      (asset: ImageConst.python, radius: 30, orbitRadius: 280, name: "Python", phase: pi, anime: thirdOrbitAngle),
    ];
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, layout) {
      final size = layout.biggest;

      Offset getCenterOffset(double radius) {
        return Offset(size.width / 2 - radius, (size.height / 2) - radius);
      }

      Offset getOrbitOffset({required double radius, required double orbit, required Animation<double> animation, required double phase}) {
        final centerOffset = getCenterOffset(radius);
        final xPos = orbit * sin(animation.value + phase);
        final yPos = orbit * cos(animation.value + phase);
        return Offset(xPos + centerOffset.dx, yPos + centerOffset.dy);
      }

      Widget orbitWidget(TechStackData tech) {
        return AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform.translate(
                offset: getOrbitOffset(
                  radius: tech.radius,
                  orbit: tech.orbitRadius,
                  animation: tech.anime!,
                  phase: tech.phase,
                ),
                child: Tooltip(
                  message: tech.name,
                  margin: EdgeInsets.only(bottom: 15),
                  child: CircleAvatar(
                      radius: tech.radius,
                      backgroundColor: Colors.orange.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(tech.asset),
                      )),
                ),
              );
            });
      }

      return SizedBox.expand(
        child: Theme(
          data: Theme.of(context).copyWith(
            tooltipTheme: Theme.of(context).tooltipTheme.copyWith(
                  textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, fontFamily: Family.orbit),
                ),
          ),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.orange.shade100.withAlpha(40),
            onHover: (hovered) {
              if (hovered) {
                _controller.stop();
              } else {
                _controller.repeat();
              }
            },
            child: CustomPaint(
              painter: OrbitalPainter(getCenterOffset(0), [195, 360, 550]),
              child: Stack(children: [
                for (final tech in techStacks) orbitWidget(tech),
                Transform.translate(
                  offset: getCenterOffset(60),
                  child: Tooltip(
                    margin: EdgeInsets.only(top: 20),
                    message: "Flutter",
                    child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.orange.shade100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 20),
                          child: SvgPicture.asset(ImageConst.flutter),
                        )),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()..translate(130, -50),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "MY SOLAR SYSTEM",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.sp, fontFamily: Family.orbit),
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    });
  }
}

class OrbitalPainter extends CustomPainter {
  final Offset center;
  final List<double> radius;
  OrbitalPainter(this.center, this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width, size.height / 2), size.width, Paint()..color = Colors.orange.shade100.withAlpha(50));
    var paint = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.stroke;
    for (final radius in radius) {
      canvas.drawArc(Rect.fromCenter(center: center, width: radius, height: radius), pi, 2 * pi, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
