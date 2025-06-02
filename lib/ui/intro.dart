import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/animations/balst.dart';
import 'package:myportfolio/util/constant/anime_duration.dart';
import 'package:myportfolio/util/constant/image_constant.dart';
import 'package:myportfolio/util/constant/links.dart';
import 'package:myportfolio/util/constant/lottie_assets.dart';
import 'package:myportfolio/util/constant/string_constant.dart';
import 'package:myportfolio/services/page_controller.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/widget/link_button.dart';
import 'package:myportfolio/widget/toast.dart';

import '../services/launch.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final introCompleter = Completer();
    final blastController = BlastController();
    // final pageNavigator = GetIt.I.get<ViewPageController>();

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
                          .animate()
                          .fade(duration: AnimeConfig.mediumDuration, begin: 0, end: 1)
                          .slideY(begin: -0.5, end: 0, duration: AnimeConfig.mediumDuration),
                      const SizedBox(height: 10),
                      Text(StringConst.inShortAbout, style: Theme.of(context).textTheme.titleMedium!)
                          .animate(delay: AnimeConfig.delayDuration)
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
                        spacing: 30,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Tooltip(
                            message: MyLinks.email,
                            child: svgIcon(ImageConst.gmail, 20, () => mailMe()),
                          ),
                          svgIcon(ImageConst.linkedIn, 20, () => openLink(MyLinks.linkedRank)),
                          svgIcon(ImageConst.hackerRank, 25, () => openLink(MyLinks.hackerRank)),
                          svgIcon(ImageConst.github, 25, () => openLink(MyLinks.gitHub)),
                          // svgIcon(ImageConst., 25, () => openLink(MyLinks.hackerRank)),
                          LinkButton(
                              onTap: () {
                                toast("Copied to clipboard");
                                Clipboard.setData(ClipboardData(text: "+91 8722469640"));
                              },
                              radius: 60,
                              child: Text("+91 8722469640", style: Theme.of(context).textTheme.labelMedium))
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
                  .animate()
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
