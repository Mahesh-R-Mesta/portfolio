import 'dart:math';

import 'package:confetti/confetti.dart' deferred as confetti;
import 'package:flutter/material.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/util/widget/differ_load.dart';

class CertificateView extends StatelessWidget {
  final String image;
  const CertificateView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: DifferLoad(
              future: confetti.loadLibrary(),
              builder: (context) {
                return confetti.ConfettiWidget(
                  emissionFrequency: 0.1,
                  blastDirection: pi / 4,
                  maxBlastForce: 40,
                  confettiController: confetti.ConfettiController(duration: const Duration(seconds: 5))..play(),
                  blastDirectionality: confetti.BlastDirectionality.directional, // don't specify a direction, blast randomly
                  shouldLoop: true, // start again as soon as the animation is finished
                  colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
                  // createParticlePath: drawStar, // define a custom shape/path.
                );
              }),
        ),
        Align(
          alignment: Alignment.topRight,
          child: DifferLoad(
              future: confetti.loadLibrary(),
              builder: (context) {
                return confetti.ConfettiWidget(
                  emissionFrequency: 0.1,
                  blastDirection: 3 * (pi / 4),
                  maxBlastForce: 40,
                  confettiController: confetti.ConfettiController(duration: const Duration(seconds: 5))..play(),
                  blastDirectionality: confetti.BlastDirectionality.directional, // don't specify a direction, blast randomly
                  shouldLoop: true, // start again as soon as the animation is finished
                  colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
                  // createParticlePath: drawStar, // define a custom shape/path.
                );
              }),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, size: 40)),
        ),
        Center(
          child: SizedBox(
              width: context.isPortrait ? size.width : size.width / 1.5,
              height: size.height / 1.5,
              child: Hero(
                  tag: image,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(image, width: size.width / 1.5, height: size.height / 1.5),
                  ))),
        ),
      ],
    );
  }
}
