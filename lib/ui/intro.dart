import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/animations/balst.dart';
import 'package:myportfolio/animations/headline_text.dart';
import 'package:myportfolio/constant/image_constant.dart';
import 'package:myportfolio/constant/links.dart';
import 'package:myportfolio/constant/lottie_assets.dart';
import 'package:myportfolio/constant/string_constant.dart';
import 'package:myportfolio/services/page_controller.dart';
import 'package:myportfolio/ui/about.dart';
import 'package:myportfolio/ui/experiance.dart';
import 'package:myportfolio/widget/link_button.dart';

import '../services/launch.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final introCompleter = Completer();
    final blastController = BlastController();
    final pageNavigator = GetIt.I.get<ViewPageController>();

    return BlastAuraAnime(
      controller: blastController,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            SizedBox(width: 60.w),
            Expanded(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 120.h, minHeight: 90.h),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.titleLarge!,
                      child: AnimatedTextKit(
                          onFinished: () {
                            introCompleter.complete("Done");
                            blastController.onStart?.call(0);
                          },
                          totalRepeatCount: 1,
                          pause: Duration(seconds: 2),
                          animatedTexts: [
                            TypewriterAnimatedText(StringConst.title),
                          ]),
                    ),
                  ),
                  FutureBuilder(
                      future: introCompleter.future,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox.shrink();
                        return DefaultTextStyle(
                          style: Theme.of(context).textTheme.titleMedium!,
                          child: AnimatedTextKit(
                            totalRepeatCount: 1,
                            pause: Duration(seconds: 1),
                            animatedTexts: [
                              TypewriterAnimatedText(StringConst.inShortAbout),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(height: 20),
                  HeadlineText(key: Key(AboutPage.tag), serial: "01", title: "About", onTap: () async => pageNavigator.navigateTo(1)),
                  HeadlineText(key: Key(Experience.tag), serial: "02", title: "Experience", onTap: () async => pageNavigator.navigateTo(2)),
                  HeadlineText(key: Key("pro"), serial: "03", title: "Projects", onTap: () async => pageNavigator.navigateTo(3)),
                  HeadlineText(key: Key("cert"), serial: "04", title: "Certificates", onTap: () async => pageNavigator.navigateTo(4)),
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
                      LinkButton(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: "+91 8722469640"));
                          },
                          radius: 60,
                          child: Text("+91 8722469640", style: Theme.of(context).textTheme.labelLarge))
                    ],
                  )
                ],
              ),
            ),
            Flexible(child: Lottie.asset(LottieAnime.desk, height: 500))
          ],
        ),
      ),
    );
  }

  svgIcon(String svgIcon, double size, Function() onTap) {
    return LinkButton(onTap: onTap, child: SvgPicture.asset(svgIcon, height: size, width: size));
  }
}
