import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlastAuraAnime extends StatefulWidget {
  final BlastController controller;
  final Widget child;

  const BlastAuraAnime({super.key, required this.child, required this.controller});
//
  @override
  State<BlastAuraAnime> createState() => _BlastAuraAnimeState();
}

class _BlastAuraAnimeState extends State<BlastAuraAnime> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> radiusTween;
  late Animation<double> carSpeed;
  ui.Image? carImage;
  @override
  void initState() {
    final width = ScreenUtil().screenWidth;
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    radiusTween = Tween<double>(begin: 0, end: 600).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    carSpeed = Tween<double>(begin: 0, end: width).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    // start();
    getImage().then((image) => carImage = image);
    super.initState();
    widget.controller
      ..onStart = (value) {
        controller.forward(from: value);
      }
      ..onStop = () {
        controller.reverse();
      };
  }

  Future<ui.Image> getImage() async {
    final completer = Completer<ui.Image>();
    final bytes = await rootBundle.load("assets/image/car.png");
    ui.decodeImageFromList(bytes.buffer.asUint8List(), (image) {
      completer.complete(image);
    });
    return completer.future;
  }

  // start() async {
  //   widget.completer.future.then((_) {
  //     controller.forward();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            painter: WavePainter(radius: radiusTween.value, carImage: carImage, carDistance: carSpeed.value),
            child: child,
          );
        },
        child: widget.child);
  }
}

class WavePainter extends CustomPainter {
  final double radius;
  final double carDistance;
  final ui.Image? carImage;
  WavePainter({required this.radius, required this.carImage, required this.carDistance});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.fill;

    // canvas.drawCircle(
    //     Offset(0, size.height / 2), radius + radius != 0 ? 100 : 0, paint..maskFilter = MaskFilter.blur(BlurStyle.normal, (5 * 0.577) + 0.5));

    canvas.drawCircle(Offset(0, size.height / 2), radius, paint);

    // if (carImage != null) canvas.drawImage(carImage!, Offset(carDistance, size.height / 2), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BlastController {
  Function(double)? onStart;
  Function()? onStop;
  BlastController();
}
