import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ContainerNavigation<T> extends StatelessWidget {
  final Widget Function(BuildContext, void Function()) closedBuilder;
  final Widget Function(BuildContext, void Function({T? returnValue})) openBuilder;
  const ContainerNavigation({super.key, required this.closedBuilder, required this.openBuilder});

  @override
  Widget build(BuildContext context) {
    return OpenContainer<T>(
        openElevation: 0,
        closedElevation: 0,
        openColor: Theme.of(context).scaffoldBackgroundColor,
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        openBuilder: openBuilder,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        closedBuilder: closedBuilder);
  }
}
