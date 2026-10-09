import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:myportfolio/animations/build_with_flutter.dart';
import 'package:myportfolio/ui/about.dart';
import 'package:myportfolio/ui/certificate/certificates.dart' deferred as certificate;
import 'package:myportfolio/ui/experience.dart';
import 'package:myportfolio/ui/footer.dart' deferred as footer;
import 'package:myportfolio/ui/intro.dart';
import 'package:myportfolio/ui/project/personal_project_page.dart';
import 'package:myportfolio/ui/project/projects_page.dart';
import 'package:myportfolio/util/constant/anime_duration.dart';
import 'package:myportfolio/util/widget/differ_load.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // final screens = [IntroPage(), AboutPage(), Experience(), Projects(), Certificate()];
  final visibilityNotifier = ValueNotifier<int>(0);
  final controller = GetIt.I.get<ScrollController>();

  List<Widget> pages = [
    IntroPage(key: ValueKey("intro")),
    AboutPage(key: ValueKey("about")),
    Experience(key: ValueKey("exp")),
    Projects(key: ValueKey("project")),
    PersonalProjectPage(key: ValueKey("personal-project")),
    DifferLoad(future: certificate.loadLibrary(), builder: (ctx) => certificate.Certificate(key: ValueKey("certificate"))),
    DifferLoad(future: footer.loadLibrary(), builder: (ctx) => footer.Footer(key: ValueKey("footer")))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
              itemCount: pages.length,
              controller: controller,
              itemBuilder: (ctx, index) {
                debugPrint(pages[index].toString());
                return pages[index];
              }),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  padding: EdgeInsets.all(20),
                  onPressed: () =>
                      controller.animateTo(0, duration: Duration(milliseconds: (controller.offset * 0.6).toInt()), curve: Curves.decelerate),
                  icon: Icon(Atlas.house),
                ),
              )),
          Positioned(top: 10, right: 80, child: BuildWithFlutter())
              .animate(delay: AnimeConfig.delayDuration)
              .slideY(begin: -5, duration: Duration(seconds: 2))
        ],
      ),
    );
  }

  Widget widgetHider({required ValueListenable<int> notifier, required Widget Function(BuildContext, int) builder}) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (ctx, page, _) => IgnorePointer(
              ignoring: page == 0,
              child: Visibility(visible: page != 0, child: builder(ctx, page)),
            ));
  }
}
