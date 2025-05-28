import 'package:atlas_icons/atlas_icons.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    List<Project> projects = [Project.arise, Project.billd, Project.smriti, Project.romysDoggyFood];
    return Scaffold(
      appBar: CustomAppBar(serialNo: "02", title: "Projects"),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: AnimationLimiter(
            child: CustomScrollView(controller: scrollController, scrollDirection: Axis.horizontal, slivers: [
              // SliverToBoxAdapter(child: SizedBox(width: 90)),
              SliverList(
                  delegate: SliverChildListDelegate.fixed(projects
                      .map((p) => AnimationConfiguration.staggeredGrid(
                          duration: Duration(seconds: 1),
                          columnCount: 3,
                          position: projects.indexOf(p),
                          child: SlideAnimation(horizontalOffset: 60, child: FadeInAnimation(child: projectCard(p)))))
                      .toList()))
            ]),
          )),
    );
  }

  Widget projectCard(Project project) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(top: 30, left: 4, right: 4),
          key: ValueKey(project.name),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 300.w,
                child: StaggeredGrid.count(
                  axisDirection: AxisDirection.down,
                  crossAxisCount: 6,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: project.imageUrl != null
                          ? Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(project.imageUrl!, scale: 0.5),
                            )
                          : Icon(Atlas.project_presentation, size: 50, color: Colors.black54),
                    ),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(project.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 10),
                            Flex(
                                direction: Axis.horizontal,
                                spacing: 8,
                                children: project.platforms
                                    .map((platform) => Tooltip(
                                          message: platform.name,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.blue.withAlpha(50),
                                              radius: 12,
                                              child: SvgPicture.asset(platform.image!, width: 15, height: 15)),
                                        ))
                                    .toList())
                          ],
                        ) // Text(project.description.join("\n"), style: const TextStyle(fontSize: 10)),
                        ),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 5,
                        child: BulletedList(
                          listItems: project.description,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                          bullet: Icon(Icons.donut_small_sharp, size: 10),
                        )),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 6,
                        mainAxisCellCount: 1,
                        child: Flex(
                          spacing: 10,
                          direction: Axis.horizontal,
                          children: project.techUsed.map((e) => chip(e.name, e.image)).toList(),
                        )),

                    // Text(project.description.join("\n"), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                  ],
                ),
              )),
        ),
        Positioned(
            right: 50,
            top: 15,
            child: Card(
                color: Colors.amberAccent.shade100,
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (project.isPersonal == true)
                        Icon(Icons.person, size: 15, color: Colors.blue)
                      else
                        Icon(Icons.factory, size: 15, color: Colors.blue),
                      Text(project.isPersonal == true ? "Personal" : project.company, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ))),
      ],
    );
  }

  Widget chip(String name, String? image) {
    return Chip(
        // backgroundColor: Colors.,
        padding: EdgeInsets.all(5),
        side: BorderSide(color: Colors.orange),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
        avatar: image != null ? SvgPicture.asset(image, width: 14, height: 14) : null,
        label: Text(name, style: TextStyle(fontSize: 12)));
  }
}

// StaggeredGrid.count(
//             crossAxisCount: 4,
//             mainAxisSpacing: 4,
//             crossAxisSpacing: 4,
//             children: [
//               StaggeredGridTile.count(
//                 crossAxisCellCount: 1,
//                 mainAxisCellCount: 1,
//                 child: Hero(
//                   tag: project.name,
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8), child: Material(child: Image.network("https://picsum.photos/200", fit: BoxFit.cover))),
//                 ),
//               ),
//               StaggeredGridTile.count(
//                 crossAxisCellCount: 3,
//                 mainAxisCellCount: 4,
//                 child: Text(project.description.join("\n")),
//               ),
//               StaggeredGridTile.count(
//                 crossAxisCellCount: 1,
//                 mainAxisCellCount: 3,
//                 child: Text(project.name, style: const TextStyle(fontSize: 20)),
//               ),
//               // StaggeredGridTile.count(
//               //   crossAxisCellCount: 4,
//               //   mainAxisCellCount: 2,
//               //   child: SwingBoardAnimation(
//               //     child: Text(project.description.join("\n")),
//               //   ),
//               // )
//             ],
//           ),
