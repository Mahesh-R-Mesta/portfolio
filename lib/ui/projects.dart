import 'package:atlas_icons/atlas_icons.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/util/constant/color_constant.dart';
import 'package:myportfolio/util/constant/image_constant.dart';
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
    return Card(
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
                  child:
                      project.imageUrl != null ? Image.asset(project.imageUrl!) : Icon(Atlas.project_presentation, size: 50, color: Colors.black54),
                ),
                StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(project.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              // fontFamily: 'CupertinoSystemText'
                            )),
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
                      direction: Axis.horizontal,
                      children: [
                        Chip(
                            // backgroundColor: Colors.,
                            padding: EdgeInsets.all(5),
                            side: BorderSide.none,
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
                            avatar: SvgPicture.asset(ImageConst.flutter, width: 14, height: 14),
                            label: Text("Flutter", style: TextStyle(fontSize: 12)))
                      ],
                    )),

                // Text(project.description.join("\n"), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
              ],
            ),
          )
          // Column(
          //   children: [
          //     Row(
          //       children: [if (project.imageUrl != null) Image.asset(project.imageUrl!)],
          //     )
          //   ],
          // )
          ),
    );
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
