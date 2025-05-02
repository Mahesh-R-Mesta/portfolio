import 'package:flutter/material.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(serialNo: "02", title: "Projects"),
      body: Padding(padding: const EdgeInsets.all(15), child: Column(children: [])),
    );
  }
}
