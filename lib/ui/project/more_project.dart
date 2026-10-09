import 'package:flutter/material.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/route.dart';
import 'package:myportfolio/ui/project/widget/project_card.dart';

class MoreProjects extends StatelessWidget {
  const MoreProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final remainingProjects = [
      Project.billd,
      Project.romysDoggyFood,
      Project.secondSmart,
      Project.corms,
      Project.arraymeter,
      Project.pro_pilot,
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text("More Projects"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: remainingProjects.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final project = remainingProjects[index];
          return Material(
            color: const Color(0xffF7F9FC),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Colors.orange, width: 1.4)),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(RouteService.projectDetail, arguments: project),
              child: ProjectCard(project: project),
            ),
          );
        },
      ),
    );
  }
}
