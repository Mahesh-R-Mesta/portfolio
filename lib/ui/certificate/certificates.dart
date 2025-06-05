import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/ui/certificate/cerificate_view.dart' deferred as certificate;
import 'package:myportfolio/util/constant/image_constant.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/util/widget/differ_load.dart';
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

    return SizedBox(
      height: images.length * context.device(150, 300),
      child: Scaffold(
          appBar: CustomAppBar(serialNo: "02", title: "Certificates"),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: AnimationLimiter(
              child: GridView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: context.isPortrait ? 1 : 3, childAspectRatio: 1.41337),
                itemBuilder: (ctx, index) {
                  return AnimationConfiguration.staggeredGrid(
                    duration: Duration(milliseconds: 500),
                    columnCount: 3,
                    delay: Duration(milliseconds: 500),
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
