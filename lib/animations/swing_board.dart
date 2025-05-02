import 'dart:math';
import 'package:flutter/material.dart';

class SwingBoardAnimation extends StatefulWidget {
  final Widget child;

  final Function? onFinish;
  const SwingBoardAnimation({super.key, this.onFinish, required this.child});

  @override
  State<SwingBoardAnimation> createState() => _SwingBoardAnimationState();
}

class _SwingBoardAnimationState extends State<SwingBoardAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> zTranslate;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    zTranslate = Tween<double>(begin: -pi / 2, end: 0).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      controller.forward();
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onFinish?.call();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.rotationX(zTranslate.value),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: widget.child,
            ),
          );
        });
  }
}


                    // if (widget.title != null)
                    //   Text(
                    //     widget.title!,
                    //     style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800, fontSize: 19),
                    //   ),
                    // const SizedBox(height: 10),
                    // Text(widget.description ?? "NA", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500)),