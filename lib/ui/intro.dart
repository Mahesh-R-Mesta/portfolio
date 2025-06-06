import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/animations/balst.dart';
import 'package:myportfolio/util/constant/anime_duration.dart';
import 'package:myportfolio/util/constant/image_constant.dart';
import 'package:myportfolio/util/constant/links.dart';
import 'package:myportfolio/util/constant/lottie_assets.dart';
import 'package:myportfolio/util/constant/string_constant.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/widget/link_button.dart';
import 'package:myportfolio/widget/toast.dart';

import '../services/launch.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blastController = BlastController();
    return SizedBox(
      height: context.screenHeight,
      child: BlastAuraAnime(
        controller: blastController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(
            mainAxisSize: MainAxisSize.min,
            direction: context.flexAxis(),
            children: [
              // SizedBox(width: 60.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: Column(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConst.title, style: Theme.of(context).textTheme.titleLarge!)
                          .animate(delay: AnimeConfig.delayDuration)
                          .fade(duration: AnimeConfig.mediumDuration, begin: 0, end: 1)
                          .slideY(begin: -0.5, end: 0, duration: AnimeConfig.mediumDuration),
                      const SizedBox(height: 10),
                      Text(StringConst.inShortAbout, style: Theme.of(context).textTheme.titleMedium!)
                          .animate(delay: AnimeConfig.delayDuration * 2)
                          .fade(duration: AnimeConfig.mediumDuration, begin: 0, end: 1)
                          .slideX(begin: -0.5, end: 0, duration: AnimeConfig.mediumDuration),
                      // FutureBuilder(
                      //     future: introCompleter.future,
                      //     builder: (context, snapshot) {
                      //       if (!snapshot.hasData) return SizedBox.shrink();
                      //       return DefaultTextStyle(
                      //         style: Theme.of(context).textTheme.titleMedium!,
                      //         child: AnimatedTextKit(
                      //           totalRepeatCount: 1,
                      //           pause: Duration(seconds: 1),
                      //           animatedTexts: [
                      //             TypewriterAnimatedText(StringConst.inShortAbout),
                      //           ],
                      //         ),
                      //       );
                      //     }),
                      const SizedBox(height: 20),
                      // ...[
                      //   HeadlineText(key: Key(AboutPage.tag), serial: "01", title: "About", onTap: () async => pageNavigator.navigateTo(1)),
                      //   HeadlineText(key: Key(Experience.tag), serial: "02", title: "Experience", onTap: () async => pageNavigator.navigateTo(2)),
                      //   HeadlineText(key: Key("pro"), serial: "03", title: "Projects", onTap: () async => pageNavigator.navigateTo(3)),
                      //   HeadlineText(key: Key("cert"), serial: "04", title: "Certificates", onTap: () async => pageNavigator.navigateTo(4))
                      // ]
                      //     .animate(delay: AnimeConfig.delayDuration * 2)
                      //     .fade(duration: AnimeConfig.mediumDuration)
                      //     .slideX(duration: AnimeConfig.mediumDuration),
                      const SizedBox(height: 30),
                      Row(
                        spacing: 26,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: context.isPortrait ? MainAxisAlignment.center : MainAxisAlignment.start,
                        children: [
                          Tooltip(
                            message: MyLinks.email,
                            child: svgIcon(ImageConst.gmail, 20, () {
                              if (isMobile()) {
                                mailMe();
                              } else {
                                toast("Copied to clipboard");
                                Clipboard.setData(ClipboardData(text: MyLinks.email));
                              }
                            }),
                          ),
                          Tooltip(message: "Connect with me", child: svgIcon(ImageConst.linkedIn, 20, () => openLink(MyLinks.linkedRank))),
                          Tooltip(
                            message: "Obtained 5 ⭐ stars in problem solving",
                            child: svgIcon(ImageConst.hackerRank, 25, () => openLink(MyLinks.hackerRank)),
                          ),
                          Tooltip(
                            message: "Read my published articles",
                            child: svgIcon(ImageConst.medium, 25, () => openLink(MyLinks.medium)),
                          ),
                          Tooltip(message: "Personal github", child: svgIcon(ImageConst.github, 25, () => openLink(MyLinks.gitHub))),
                          // Tooltip(message: "Only 72 problem solved..", child: svgIcon(ImageConst.leetcode, 25, () => openLink(MyLinks.leetCode))),
                          Tooltip(
                              message: "Call me",
                              child: svgIcon(
                                ImageConst.phone,
                                25,
                                () async {
                                  if (isMobile()) {
                                    await openLink("tel:${MyLinks.phoneNumb}");
                                  } else {
                                    Clipboard.setData(ClipboardData(text: "+91 8722469640"));
                                    toast("Copied phone number +91 8722469640");
                                  }
                                },
                              )),
                          // svgIcon(ImageConst., 25, () => openLink(MyLinks.hackerRank)),
                          // Tooltip(
                          //   message: "Call me",
                          //   child: LinkButton(
                          //       onTap: () async {
                          //         if (isMobile()) {
                          //           await openLink("tel:${MyLinks.phoneNumb}");
                          //         } else {
                          //           Clipboard.setData(ClipboardData(text: "+91 8722469640"));
                          //           toast("Copied to clipboard");
                          //         }
                          //       },
                          //       radius: 60,
                          //       child: Text("+91 8722469640", style: Theme.of(context).textTheme.labelSmall)),
                          // )
                        ],
                      )
                          .animate(delay: AnimeConfig.delayDuration * 3, onComplete: (_) => blastController.onStart?.call(0))
                          .fade(duration: AnimeConfig.mediumDuration)
                          .slideY(duration: AnimeConfig.mediumDuration, begin: 0.5, end: 0),
                    ],
                  ),
                ),
              ),
              Flexible(child: Lottie.asset(LottieAnime.desk, height: 400, repeat: false))
                  .animate(delay: AnimeConfig.delayDuration)
                  .fade(duration: AnimeConfig.mediumDuration)
                  .slideX(begin: 0.5, end: 0, duration: AnimeConfig.mediumDuration)
            ],
          ),
        ),
      ),
    );
  }

  svgIcon(String svgIcon, double size, Function() onTap) {
    return LinkButton(onTap: onTap, child: SvgPicture.asset(svgIcon, height: size, width: size));
  }
}
