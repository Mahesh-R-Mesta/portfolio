import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/constant/image_constant.dart';
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
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return Center(
          child: SizedBox(
            width: size.width / 1.5,
            height: size.height / 1.5,
            child: Stack(
              children: [
                Hero(
                  tag: image,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(image, width: size.width / 1.5, height: size.height / 1.5),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: () => Navigator.pop(ctx), icon: Icon(Icons.close, size: 40)),
                )
              ],
            ),
          ),
        );
      }));
    }

    return Scaffold(
      appBar: CustomAppBar(serialNo: "02", title: "Certificates"),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: AnimationLimiter(
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.41337),
              itemBuilder: (ctx, index) {
                return AnimationConfiguration.staggeredList(
                  duration: Duration(seconds: 1),
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
          )),
    );
  }
}
