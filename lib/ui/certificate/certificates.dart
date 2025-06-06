import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myportfolio/animations/slide_animation.dart';
import 'package:myportfolio/ui/certificate/cerificate_view.dart' deferred as certificate;
import 'package:myportfolio/util/animation_helper.dart';
import 'package:myportfolio/util/constant/image_constant.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/util/widget/differ_load.dart';

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
      Navigator.of(context).push(PageRouteBuilder(
          fullscreenDialog: true,
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (ctx, _, __) {
            return DifferLoad(
                future: certificate.loadLibrary(),
                builder: (context) {
                  return certificate.CertificateView(image: image);
                });
          }));
    }

    final controller = GetIt.I.get<ScrollController>();
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: images.length * context.device(150, 300),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: CustomSlideFadeAnimation(
                controller: controller,
                position: context.device(1981, 2960),
                range: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(spacing: 15, children: [
                    Container(color: Colors.black, width: 50, height: 3),
                    Text("Certificate", style: theme.titleLarge?.copyWith(fontSize: 25)),
                  ]),
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: context.isPortrait ? 1 : 3, childAspectRatio: 1.41337),
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () => show(context, images[index]),
                  child: Hero(
                    tag: images[index],
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        final value = AnimationHelper.scrollPortion(controller, context.device(1981, 3200) + (index * context.device(80, 40)), 300);
                        return FadeTransition(opacity: AlwaysStoppedAnimation(value), child: Transform.scale(scale: value, child: child));
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(images[index]),
                          )),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
