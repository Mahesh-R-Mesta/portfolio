import 'package:flutter/material.dart';
import 'package:myportfolio/services/launch.dart';

class LinkButton extends StatefulWidget {
  final Widget child;
  final double radius;
  final Function() onTap;
  const LinkButton({super.key, required this.child, this.radius = 15, required this.onTap});

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> elevation;
  late Animation<double> shadowRadius;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    elevation = Tween<double>(begin: 0, end: -12).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    shadowRadius = Tween<double>(begin: widget.radius, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (isHovering) {
        if (isHovering) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      onTap: isMobile()
          ? () {
              _controller.forward().then((_) {
                _controller.reverse().then((_) {
                  widget.onTap();
                });
              });
            }
          : widget.onTap,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
                painter: Shadow(shadowRadius.value),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Transform.translate(offset: Offset(0, elevation.value), child: widget.child),
                ));
          }),
    );
  }
}

class Shadow extends CustomPainter {
  final double shadowSize;
  Shadow(this.shadowSize);
  @override
  void paint(Canvas canvas, Size size) {
    var shadowPaint = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2 * 0.57735 + 0.5);
    final centerWidth = size.width / 2;
    final centerHeight = (size.height - (size.height / 12));

    canvas.drawOval(Rect.fromLTRB(centerWidth - shadowSize, centerHeight, centerWidth + shadowSize, size.height), shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
