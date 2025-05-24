import 'package:flutter/material.dart';
import 'package:myportfolio/util/constant/color_constant.dart';

class SideMountedOption extends StatefulWidget {
  final double initialHeightFactor;
  final String label;
  final Function() onTap;
  final bool fill;
  const SideMountedOption({super.key, required this.initialHeightFactor, required this.label, required this.onTap, this.fill = false});

  @override
  State<SideMountedOption> createState() => _SideMountedOptionState();
}

class _SideMountedOptionState extends State<SideMountedOption> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> widthFactor;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    widthFactor = Tween<double>(begin: widget.initialHeightFactor, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      onHover: (isHovering) {
        if (isHovering) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Material(
              color: widget.fill ? ColorConst.primaryBtnColor : null,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.orange, width: 2), borderRadius: BorderRadius.horizontal(left: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    child: Align(
                        widthFactor: widthFactor.value,
                        alignment: Alignment.centerLeft,
                        child: Text(widget.label,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700, color: widget.fill ? Colors.white : null)))),
              ),
            );
          }),
    );
  }
}
