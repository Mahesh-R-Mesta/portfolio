import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/animations/swing_board.dart';
import 'package:myportfolio/util/animation_helper.dart';
import 'package:myportfolio/util/constant/lottie_assets.dart';
import 'package:myportfolio/widget/icon_express.dart';
import 'package:myportfolio/widget/text_tile.dart';

class AboutPage extends StatelessWidget {
  static const String name = "/about";
  static const String tag = "about";
  final ScrollController controller;
  const AboutPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).textTheme;
    final about = """ Experienced Flutter developer with 4+ years of expertise in building
 dynamic and feature-rich applications. Eager to continuously upskill, I’ve
 successfully resolved complex implementation challenges by learning and
 applying native programming languages within Flutter""";
    return SizedBox(
      height: ScreenUtil().screenHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final value = AnimationHelper.scrollPortion(controller, 50, 300);
                      return Transform.translate(
                        key: ValueKey(value),
                        offset: Offset(-800 + value * 800, 0),
                        child: FadeTransition(
                          opacity: AnimationHelper.square(value),
                          child: child,
                        ),
                      );
                    },
                    child: TextTile(
                      title: "About me 😀",
                      description: about,
                    )),
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final value = AnimationHelper.scrollPortion(controller, 80, 390);
                      return Transform.translate(
                        key: ValueKey(value),
                        offset: Offset(-800 + value * 800, 0),
                        child: FadeTransition(
                          opacity: AnimationHelper.square(value),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTile(title: "What i like to do"),
                        Row(
                          spacing: 20,
                          children: [
                            IconExpress(
                              icon: Atlas.seated_pose,
                              text: "Mediation",
                            ),
                            IconExpress(
                              icon: Atlas.book,
                              text: "Reading Book",
                            ),
                            IconExpress(
                              icon: Atlas.gamepad_bold,
                              text: "Playing game",
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final value = AnimationHelper.scrollPortion(controller, 30, 450);
                  return Transform.translate(
                      key: ValueKey(key),
                      offset: Offset(500 - value * 500, 0),
                      child: FadeTransition(opacity: AnimationHelper.square(value), child: child));
                },
                child: Lottie.asset(LottieAnime.monkey, width: 450))
          ],
        ),
      ),
    );
  }
}
