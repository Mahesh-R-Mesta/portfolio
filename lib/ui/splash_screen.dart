import 'package:flutter/material.dart';
import 'package:myportfolio/ui/home.dart' deferred as home;
import 'package:myportfolio/util/widget/differ_load.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DifferLoad(future: home.loadLibrary(), builder: (ctx) => home.HomePage());
  }
}
