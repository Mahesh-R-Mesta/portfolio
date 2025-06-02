import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/animations/online.dart';
import 'package:myportfolio/util/constant/color_constant.dart';
import 'package:myportfolio/util/constant/image_constant.dart';
import 'package:myportfolio/util/constant/string_constant.dart';
import 'package:myportfolio/util/extension/context.dart';

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
  var enableSystem = ValueNotifier<bool>(true);

  double radius = 50;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    thirdOrbitAngle = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    secondOrbitAngle = Tween<double>(begin: 0, end: 4 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    firstOrbitAngle = Tween<double>(begin: 0, end: 8 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    techStacks = [
      (asset: ImageConst.uiUx, radius: 20, orbitRadius: 100, name: "UI/UX", phase: pi / 4, anime: firstOrbitAngle),
      (asset: ImageConst.swift, radius: 25, orbitRadius: 160, name: "Swift", phase: pi / 2, anime: secondOrbitAngle),
      (asset: ImageConst.api, radius: 20, orbitRadius: 100, name: "API INTEGRATION", phase: (pi * 3) / 4, anime: firstOrbitAngle),
      (asset: ImageConst.android, radius: 25, orbitRadius: 160, name: "ANDROID", phase: 0, anime: secondOrbitAngle),
      (asset: ImageConst.kotlin, radius: 25, orbitRadius: 160, name: "KOTLIN", phase: pi, anime: secondOrbitAngle),
      (asset: ImageConst.firebase, radius: 20, orbitRadius: 100, name: "Firebase", phase: pi + (pi / 4), anime: firstOrbitAngle),
      (asset: ImageConst.java, radius: 25, orbitRadius: 160, name: "Java", phase: pi + (pi / 2), anime: secondOrbitAngle),
      (asset: ImageConst.dart, radius: 20, orbitRadius: 100, name: "Dart", phase: pi + (pi * 3 / 4), anime: firstOrbitAngle),
      (asset: ImageConst.python, radius: 25, orbitRadius: 230, name: "Python", phase: pi, anime: thirdOrbitAngle),
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
    return SizedBox(
      height: context.screenHeight * context.device(1, 0.7),
      width: context.screenWidth * context.device(0.45, 1),
      child: LayoutBuilder(builder: (context, layout) {
        final size = layout.biggest;

        Offset getCenterOffset(double radius) => Offset((size.width / 2) - radius, (size.height / 2) - radius);

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
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(tech.asset),
                        )),
                  ),
                );
              });
        }

        return SizedBox.expand(
          child: Theme(
            data: Theme.of(context).copyWith(
              tooltipTheme: Theme.of(context)
                  .tooltipTheme
                  .copyWith(textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700) //, fontFamily: Family.orbit),
                      ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                onTap: () {
                  if (!context.isPortrait) return;
                  if (enableSystem.value) {
                    enableSystem.value = false;
                    _controller.stop();
                  } else {
                    enableSystem.value = true;
                    _controller.repeat();
                  }
                },
                splashColor: Colors.orange.shade100.withAlpha(40),
                onHover: (hovered) {
                  if (hovered) {
                    enableSystem.value = false;
                    _controller.stop();
                  } else {
                    enableSystem.value = true;
                    _controller.repeat();
                  }
                },
                child: CustomPaint(
                  painter: OrbitalPainter(getCenterOffset(0), [195, 320, 460]),
                  child: Stack(children: [
                    for (final tech in techStacks) orbitWidget(tech),
                    Transform.translate(
                      offset: getCenterOffset(radius),
                      child: Tooltip(
                        margin: EdgeInsets.only(top: 20),
                        message: "Flutter",
                        child: CircleAvatar(
                            radius: radius,
                            backgroundColor: Colors.orange.shade100,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 20),
                              child: SvgPicture.asset(ImageConst.flutter),
                            )),
                      ),
                    ),
                    Positioned(
                      // transform: Matrix4.identity()..translate(130, 0),
                      // alignment: Alignment.topCenter,
                      top: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "MY TECH SOLAR SYSTEM",
                                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, fontFamily: Family.orbit),
                              ),
                              ValueListenableBuilder(
                                  valueListenable: enableSystem,
                                  builder: (context, enable, _) {
                                    return Online(enable: enable);
                                  })
                            ],
                          ),
                          Text(
                            "My work revolve around these...",
                            style: TextStyle(fontSize: 10, color: ColorConst.hintText),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class OrbitalPainter extends CustomPainter {
  final Offset center;
  final List<double> radius;
  OrbitalPainter(this.center, this.radius);
  @override
  void paint(Canvas canvas, Size size) {
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
