import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/animations/swing_board.dart';
import 'package:myportfolio/util/constant/lottie_assets.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';
import 'package:myportfolio/widget/icon_express.dart';
import 'package:myportfolio/widget/text_tile.dart';

class AboutPage extends StatelessWidget {
  static const String name = "/about";
  static const String tag = "about";
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).textTheme;
    final about = """ Experienced Flutter developer with 4+ years of expertise in building
 dynamic and feature-rich applications. Eager to continuously upskill, I’ve
 successfully resolved complex implementation challenges by learning and
 applying native programming languages within Flutter""";
    return PopScope(
      onPopInvokedWithResult: (did, res) {},
      child: Scaffold(
        appBar: CustomAppBar(serialNo: "01", title: "About"),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                spacing: 30,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DefaultTextStyle(
                  //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                  //   child: AnimatedTextKit(onFinished: () {}, totalRepeatCount: 1, pause: Duration(seconds: 1), animatedTexts: [
                  //     TyperAnimatedText(about),
                  //   ]),
                  // ),
                  SwingBoardAnimation(
                    child: TextTile(
                      title: "About me 😀",
                      description: about,
                    ),
                  ),
                  SwingBoardAnimation(
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
                    ),
                  ),
                ],
              ),
              Lottie.asset(LottieAnime.monkey)
            ],
          ),
        ),
      ),
    );
  }
}
