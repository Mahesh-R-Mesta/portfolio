import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/animations/swing_board.dart';
import 'package:myportfolio/util/constant/projects.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    List<Project> projects = [Project.billd, Project.smriti, Project.romysDoggyFood];
    return Scaffold(
      appBar: CustomAppBar(serialNo: "02", title: "Projects"),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: CustomScrollView(controller: scrollController, scrollDirection: Axis.horizontal, slivers: [
            // SliverToBoxAdapter(child: SizedBox(width: 90)),
            SliverList(delegate: SliverChildListDelegate.fixed(projects.map(projectCard).toList()))
          ])),
    );
  }

  Widget projectCard(Project project) {
    return Card(
      key: ValueKey(project.name),
      child: SizedBox(
        width: 300.w,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Hero(
                  tag: project.name,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8), child: Material(child: Image.network("https://picsum.photos/200", fit: BoxFit.cover))),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 4,
                child: Text(project.description.join("\n")),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 3,
                child: Text(project.name, style: const TextStyle(fontSize: 20)),
              ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 4,
              //   mainAxisCellCount: 2,
              //   child: SwingBoardAnimation(
              //     child: Text(project.description.join("\n")),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
