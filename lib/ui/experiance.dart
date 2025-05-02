import 'package:flutter/material.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Experience extends StatelessWidget {
  static const String name = "/experience";
  static const String tag = "exp";

  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(serialNo: "02", title: "Experience"),
      body: Padding(padding: const EdgeInsets.all(15), child: Column(children: [])),
    );
  }
}
