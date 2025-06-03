import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myportfolio/animations/build_with_flutter.dart';
import 'package:myportfolio/ui/about.dart';
import 'package:myportfolio/ui/certificates.dart';
import 'package:myportfolio/ui/experience.dart';
import 'package:myportfolio/ui/footer.dart';
import 'package:myportfolio/ui/intro.dart';
import 'package:myportfolio/ui/project/projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // final screens = [IntroPage(), AboutPage(), Experience(), Projects(), Certificate()];
  final visibilityNotifier = ValueNotifier<int>(0);
  final controller = GetIt.I.get<ScrollController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: controller,
            children: [
              IntroPage(),
              AboutPage(),
              Experience(),
              Projects(),
              Certificate(),
              Footer(),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.all(20),
                onPressed: () =>
                    controller.animateTo(0, duration: Duration(milliseconds: (controller.offset * 0.6).toInt()), curve: Curves.decelerate),
                icon: Icon(Atlas.house),
              )),
          Positioned(top: 10, right: 80, child: BuildWithFlutter())
          // Positioned(
          //     right: -2,
          //     top: size.height / 7,
          //     child: widgetHider(
          //       notifier: visibilityNotifier,
          //       builder: (ctx, page) => SideMountedOption(
          //         initialHeightFactor: 0.24,
          //         fill: page == 1,
          //         label: "About",
          //         onTap: () => pageController.navigateTo(1),
          //       ),
          //     )),
          // Positioned(
          //     right: -2,
          //     top: (size.height / 7) * 2,
          //     child: widgetHider(
          //       notifier: visibilityNotifier,
          //       builder: (ctx, page) => SideMountedOption(
          //         initialHeightFactor: 0.1,
          //         fill: page == 2,
          //         label: "Experience",
          //         onTap: () => pageController.navigateTo(2),
          //       ),
          //     )),
          // Positioned(
          //     right: -2,
          //     top: (size.height / 7) * 3,
          //     child: widgetHider(
          //       notifier: visibilityNotifier,
          //       builder: (ctx, page) => SideMountedOption(
          //         initialHeightFactor: 0.15,
          //         fill: page == 3,
          //         label: "Projects",
          //         onTap: () => pageController.navigateTo(3),
          //       ),
          //     )),
          // Positioned(
          //     right: -2,
          //     top: (size.height / 7) * 4,
          //     child: widgetHider(
          //       notifier: visibilityNotifier,
          //       builder: (ctx, page) => SideMountedOption(
          //         initialHeightFactor: 0.1,
          //         fill: page == 4,
          //         label: "Certificate",
          //         onTap: () => pageController.navigateTo(4),
          //       ),
          //     )),
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
