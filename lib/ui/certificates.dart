import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/util/constant/image_constant.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Certificate extends StatelessWidget {
  static const String name = "/experience";
  static const String tag = "exp";

  const Certificate({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      ImageConst.codeMatrixCert,
      ImageConst.udamy1Cert,
      ImageConst.problemSolveCert,
      ImageConst.journalCert,
      ImageConst.pythonCert
    ];

    show(BuildContext context, String image) async {
      final size = MediaQuery.of(context).size;
      Navigator.of(context).push(PageRouteBuilder(
          fullscreenDialog: true,
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (ctx, _, __) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ConfettiWidget(
                    emissionFrequency: 0.1,
                    blastDirection: pi / 4,
                    maxBlastForce: 40,
                    confettiController: ConfettiController(duration: const Duration(seconds: 5))..play(),
                    blastDirectionality: BlastDirectionality.directional, // don't specify a direction, blast randomly
                    shouldLoop: true, // start again as soon as the animation is finished
                    colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
                    // createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ConfettiWidget(
                    emissionFrequency: 0.1,
                    blastDirection: 3 * (pi / 4),
                    maxBlastForce: 40,
                    confettiController: ConfettiController(duration: const Duration(seconds: 5))..play(),
                    blastDirectionality: BlastDirectionality.directional, // don't specify a direction, blast randomly
                    shouldLoop: true, // start again as soon as the animation is finished
                    colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
                    // createParticlePath: drawStar, // define a custom shape/path.
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: IconButton(onPressed: () => Navigator.pop(ctx), icon: Icon(Icons.close, size: 40)),
                ),
                Center(
                  child: SizedBox(
                    width: size.width / 1.5,
                    height: size.height / 1.5,
                    child: Hero(
                      tag: image,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(image, width: size.width / 1.5, height: size.height / 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }));
    }

    return SizedBox(
      height: ScreenUtil().screenHeight * 1.2,
      child: Scaffold(
          appBar: CustomAppBar(serialNo: "02", title: "Certificates"),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: AnimationLimiter(
              child: GridView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.41337),
                itemBuilder: (ctx, index) {
                  return AnimationConfiguration.staggeredGrid(
                    duration: Duration(seconds: 1),
                    columnCount: 3,
                    delay: Duration(seconds: 1),
                    position: index,
                    child: SlideAnimation(
                      verticalOffset: 60,
                      child: FadeInAnimation(
                        child: InkWell(
                          onTap: () => show(context, images[index]),
                          child: Hero(
                            tag: images[index],
                            child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(images[index]),
                                )),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
