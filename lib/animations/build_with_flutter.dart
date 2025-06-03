import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:myportfolio/util/animation_helper.dart';
import 'package:myportfolio/util/constant/image_constant.dart';

class BuildWithFlutter extends StatefulWidget {
  const BuildWithFlutter({super.key});

  @override
  State<BuildWithFlutter> createState() => _BuildWithFlutterState();
}

class _BuildWithFlutterState extends State<BuildWithFlutter> with SingleTickerProviderStateMixin {
  final controller = GetIt.I.get<ScrollController>();

  double rotate() {
    final value = AnimationHelper.scrollPortion(controller, 0, 200);
    return value * 2 * pi;
  }

  double width() {
    final value = AnimationHelper.scrollPortion(controller, 0, 200);
    return 1 - value;
  }

  translateY() {
    final value = AnimationHelper.scrollPortion(controller, 400, 300);
    return -200 + ((1 - value) * 200);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final yTranslate = translateY();
          if (yTranslate == 1) return SizedBox.shrink();
          return Transform.translate(
            offset: Offset(0, yTranslate),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.blue, border: Border.all(color: Colors.blue)),
              child: Row(
                children: [
                  ClipRRect(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: width(),
                        child: Text("  Build using ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white))),
                  ),
                  Transform.rotate(angle: rotate(), child: child)
                ],
              ),
            ),
          );
        },
        child: CircleAvatar(radius: 13, backgroundColor: Colors.white, child: SvgPicture.asset(ImageConst.flutter, width: 13, height: 13)));
  }
}
