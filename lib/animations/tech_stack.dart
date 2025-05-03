import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/constant/image_constant.dart';

typedef TechStackData = ({double radius, double orbitRadius, double phase, String asset, Animation<double>? anime});

class TechStackAnime extends StatefulWidget {
  const TechStackAnime({super.key});

  @override
  State<TechStackAnime> createState() => _TechStackAnimeState();
}

class _TechStackAnimeState extends State<TechStackAnime> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> firstOrbitAngle;
  late Animation<double> secondOrbitAngle;
  late List<TechStackData> techStacks;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    firstOrbitAngle = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    secondOrbitAngle = Tween<double>(begin: 0, end: 4 * pi).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    techStacks = [
      (asset: ImageConst.android, radius: 25, orbitRadius: 100, phase: pi / 4, anime: secondOrbitAngle),
      (asset: ImageConst.swift, radius: 30, orbitRadius: 180, phase: pi / 2, anime: firstOrbitAngle),
      (asset: ImageConst.kotlin, radius: 25, orbitRadius: 100, phase: (pi * 3) / 4, anime: secondOrbitAngle),
      (asset: ImageConst.uiUx, radius: 30, orbitRadius: 180, phase: 0, anime: firstOrbitAngle),
      (asset: ImageConst.api, radius: 30, orbitRadius: 180, phase: pi, anime: firstOrbitAngle),
      (asset: ImageConst.firebase, radius: 25, orbitRadius: 100, phase: pi + (pi / 4), anime: secondOrbitAngle),
      (asset: ImageConst.java, radius: 30, orbitRadius: 180, phase: pi + (pi / 2), anime: firstOrbitAngle),
      (asset: ImageConst.dart, radius: 25, orbitRadius: 100, phase: pi + (pi * 3 / 4), anime: secondOrbitAngle),
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

      // Offset verticalOrbit({required double radius, required double orbitRadius, double phase = 0, Animation<double>? animation}) {
      //   final centerOffset = getCenterOffset(radius);
      //   double yPos = 0;
      //   double xPos = 0;
      //   if (animation?.value != null) {
      //     final angle = animation!.value;
      //     yPos = orbitRadius * sin(angle) * sin(phase);
      //     xPos = orbitRadius * sin(angle) * cos(phase);
      //   }
      //   return Offset(xPos + centerOffset.dx, yPos + centerOffset.dy);
      // }

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
                child: CircleAvatar(
                    radius: tech.radius,
                    backgroundColor: Colors.blue.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(tech.asset),
                    )),
              );
            });
      }

      return SizedBox.expand(
        child: Stack(children: [
          for (final tech in techStacks) orbitWidget(tech),
          Transform.translate(
            offset: getCenterOffset(60),
            child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 20),
                  child: SvgPicture.asset(ImageConst.flutter),
                )),
          ),
        ]),
      );
    });
  }
}
