import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart' deferred as lottie;
import 'package:myportfolio/animations/slide_animation.dart';
import 'package:myportfolio/util/animation_helper.dart';
import 'package:myportfolio/util/constant/lottie_assets.dart';
import 'package:myportfolio/util/constant/string_constant.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/util/widget/differ_load.dart';
import 'package:myportfolio/widget/icon_express.dart';
import 'package:myportfolio/widget/text_tile.dart';

class AboutPage extends StatelessWidget {
  static const String name = "/about";
  static const String tag = "about";
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ScrollController>();
    return SizedBox(
      height: context.screenHeight * context.device(1, 1.15),
      width: context.screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Flex(
          direction: context.flexAxis(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: context.screenWidth * context.device(0.5, 1),
                  child: CustomSlideFadeAnimation(
                    controller: controller,
                    position: 50,
                    range: 300,
                    translate: 800,
                    direction: AxisDirection.right,
                    fadeCurve: AnimationHelper.square,
                    child: TextTile(
                      title: "About me 😀",
                      description: StringConst.about,
                    ),
                  ),
                ),
                CustomSlideFadeAnimation(
                  controller: controller,
                  position: 150,
                  range: 400,
                  translate: 800,
                  direction: AxisDirection.right,
                  fadeCurve: AnimationHelper.square,
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
                            icon: Atlas.heart_book_thin,
                            text: "Reading Book",
                          ),
                          IconExpress(
                            icon: Atlas.music_note,
                            text: "Listening Music",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            CustomSlideFadeAnimation(
                controller: controller,
                position: context.device(30, 350),
                range: 450,
                translate: 500,
                fadeCurve: AnimationHelper.square,
                child: DifferLoad(future: lottie.loadLibrary(), builder: (ctx) => lottie.Lottie.asset(LottieAnime.monkey, width: 450)))
          ],
        ),
      ),
    );
  }
}
