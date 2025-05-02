import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineText extends StatefulWidget {
  final String serial;
  final String title;
  final Function() onTap;
  const HeadlineText({super.key, required this.serial, required this.title, required this.onTap});

  @override
  State<HeadlineText> createState() => _HeadlineTextState();
}

class _HeadlineTextState extends State<HeadlineText> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> lineAnime;
  late Animation<double> opacityAnime;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    lineAnime = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    opacityAnime = Tween(begin: 0.4, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      onHover: (hovering) {
        if (hovering) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      child: Row(
        children: [
          AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Material(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: SizedBox(width: lineAnime.value, height: 3),
                );
              }),
          const SizedBox(width: 5),
          AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Opacity(opacity: opacityAnime.value, child: Text(widget.serial, style: theme.bodyMedium?.copyWith(fontSize: 14.sp)));
              }),
          const SizedBox(width: 10),
          AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Opacity(
                  opacity: opacityAnime.value,
                  child: Transform.scale(
                    scale: 1 + (opacityAnime.value * 0.05),
                    child: Text(widget.title, style: theme.titleLarge?.copyWith(fontSize: 20.sp)),
                  ),
                );
              })
        ],
      ),
    );
  }
}
