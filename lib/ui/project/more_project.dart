import 'package:flutter/material.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/route.dart';
import 'package:myportfolio/ui/project/widget/project_card.dart';

class MoreProjects extends StatelessWidget {
  const MoreProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final remainingProjects = [Project.secondSmart, Project.pro_pilot];
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back))),
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
                      child: InkWell(
                          onTap: () => Navigator.of(context).pushNamed(RouteService.projectDetail, arguments: remainingProjects[index]),
                          child: ProjectCard(project: remainingProjects[index])),
                    )),
          ],
        ),
      ),
    );
  }
}
