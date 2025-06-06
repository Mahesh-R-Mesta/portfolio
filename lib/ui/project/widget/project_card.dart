import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/util/extension/context.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth * context.device(0.6, 1);
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              heightFactor: 0.42,
              child: Opacity(
                opacity: 0.1,
                child: Hero(
                  tag: project.name,
                  child: project.imageUrl != null
                      ? Image.asset(project.imageUrl!, width: 200, height: 200)
                      : Icon(Atlas.project_presentation, size: 50, color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(project.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                  Text(project.shortDescription, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
