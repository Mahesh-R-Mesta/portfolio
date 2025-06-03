import 'package:flutter/material.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/ui/project/project_detail.dart';
import 'package:myportfolio/ui/project/widget/container_navigation.dart';
import 'package:myportfolio/ui/project/widget/project_card.dart';

class MoreProjects extends StatelessWidget {
  final Function() close;
  const MoreProjects({super.key, required this.close});

  @override
  Widget build(BuildContext context) {
    final remainingProjects = [Project.secondSmart, Project.pro_pilot];
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: close, icon: Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
                remainingProjects.length,
                (index) => Material(
                      color: Color(0xffF7F9FC),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.orange, width: 1.4)),
                      child: ContainerNavigation(
                          openBuilder: (ctx, closeContainer) =>
                              ProjectDetail(project: remainingProjects[index], popCall: () => closeContainer.call()),
                          closedBuilder: (ctx, open) => InkWell(onTap: () => open(), child: ProjectCard(project: remainingProjects[index]))),
                    )),
          ],
        ),
      ),
    );
  }
}
