import 'package:flutter/material.dart';

class Online extends StatefulWidget {
  final bool enable;
  const Online({super.key, required this.enable});
  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );
  late Animation<double> scale;
  late Animation<double> fade;
  Color activeColor = Colors.green;
  Color deactivateColor = Colors.red;
  @override
  void initState() {
    scale = Tween(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
    fade = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  final color = widget.enable ? activeColor : deactivateColor;
                  return Transform.scale(
                    scale: scale.value,
                    child: Material(
                      color: color.withOpacity(fade.value),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      child: SizedBox.square(dimension: 7),
                    ),
                  );
                }),
          ),
          Center(
            child: Material(
              color: widget.enable ? activeColor : deactivateColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: SizedBox.square(dimension: 7),
            ),
          ),
        ],
      ),
    );
  }
}
