import 'package:flutter/material.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/route.dart';
import 'package:myportfolio/ui/project/widget/project_card.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class PersonalProjectPage extends StatelessWidget {
  const PersonalProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [Project.arise, Project.snippic];
    return SizedBox(
      height: context.screenHeight * context.device(0.8, 0.75),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            CustomAppBar(serialNo: "", title: "Personal Projects"),
            Text(
              "A selection of projects I have built independently.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            ...projects.map(
              (project) => Material(
                color: const Color(0xffF7F9FC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.orange, width: 1.4),
                ),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                      RouteService.projectDetail,
                      arguments: project),
                  child: ProjectCard(project: project),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
