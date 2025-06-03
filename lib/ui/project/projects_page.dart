import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myportfolio/animations/slide_animation.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/ui/project/more_project.dart';
import 'package:myportfolio/ui/project/project_detail.dart';
import 'package:myportfolio/ui/project/widget/container_navigation.dart';
import 'package:myportfolio/ui/project/widget/project_card.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ScrollController>();
    List<Project> projects = [Project.arise, Project.billd, Project.smriti, Project.romysDoggyFood];
    return SizedBox(
      height: context.device(1, 0.75) * context.screenHeight,
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 10, children: [
            CustomSlideFadeAnimation(
              controller: controller,
              position: context.device(1260, 2500),
              range: 200,
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(serialNo: "", title: "Projects"),
                  Text("Here are my few recent projects...", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            ...List.generate(
                projects.length,
                (index) => CustomSlideFadeAnimation(
                      controller: controller,
                      position: context.device(1400, 2500) + (index * context.device(120, 200)),
                      range: 200,
                      child: Material(
                        color: Color(0xffF7F9FC),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.orange, width: 1.4)),
                        child: ContainerNavigation(
                            openBuilder: (ctx, closeContainer) => ProjectDetail(project: projects[index], popCall: () => closeContainer.call()),
                            closedBuilder: (ctx, open) => InkWell(onTap: () => open(), child: ProjectCard(project: projects[index]))),
                      ),
                    )),
            CustomSlideFadeAnimation(
              controller: controller,
              position: context.device(1850, 3250),
              range: 200,
              child: ContainerNavigation(
                  openBuilder: (ctx, close) => MoreProjects(close: close),
                  closedBuilder: (context, open) {
                    return InkWell(
                      onTap: open,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          color: Color(0xffF7F9FC),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.orange, width: 1.4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            child: Text("See more..."),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ])),
    );
  }
}

  // Widget chip(String name, String? image) {
  //   return Chip(
  //       // backgroundColor: Colors.,
  //       padding: EdgeInsets.all(5),
  //       side: BorderSide(color: Colors.orange),
  //       elevation: 2,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
  //       avatar: image != null ? SvgPicture.asset(image, width: 14, height: 14) : null,
  //       label: Text(name, style: TextStyle(fontSize: 12)));
  // }

            // AnimationLimiter(
            //   child: CustomScrollView(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       controller: scrollController,
            //       scrollDirection: Axis.vertical,
            //       slivers: [
            //         // SliverToBoxAdapter(child: SizedBox(width: 90)),
            //         SliverList(
            //             delegate: SliverChildListDelegate.fixed(projects
            //                 .map((p) => AnimationConfiguration.staggeredGrid(
            //                     duration: Duration(seconds: 1),
            //                     columnCount: 3,
            //                     position: projects.indexOf(p),
            //                     child: SlideAnimation(horizontalOffset: 60, child: FadeInAnimation(child: cardWidget(p)))))
            //                 .toList()))
            //       ]),
            // ),

  // Widget projectCard(Project project) {
  //   return Stack(
  //     children: [
  //       Card(
  //         margin: EdgeInsets.only(top: 30, left: 4, right: 4),
  //         key: ValueKey(project.name),
  //         child: Padding(
  //             padding: const EdgeInsets.all(10),
  //             child: SizedBox(
  //               width: 300.w,
  //               child: StaggeredGrid.count(
  //                 axisDirection: AxisDirection.left,
  //                 crossAxisCount: 6,
  //                 mainAxisSpacing: 6,
  //                 crossAxisSpacing: 6,
  //                 children: [
  //                   StaggeredGridTile.count(
  //                     crossAxisCellCount: 2,
  //                     mainAxisCellCount: 2,
  //                     child: project.imageUrl != null
  //                         ? Padding(
  //                             padding: const EdgeInsets.all(18.0),
  //                             child: Image.asset(project.imageUrl!, scale: 0.5),
  //                           )
  //                         : Icon(Atlas.project_presentation, size: 50, color: Colors.black54),
  //                   ),
  //                   StaggeredGridTile.count(
  //                       crossAxisCellCount: 4,
  //                       mainAxisCellCount: 2,
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(project.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
  //                           const SizedBox(height: 10),
  //                           Flex(
  //                               direction: Axis.horizontal,
  //                               spacing: 8,
  //                               children: project.platforms
  //                                   .map((platform) => Tooltip(
  //                                         message: platform.name,
  //                                         child: CircleAvatar(
  //                                             backgroundColor: Colors.blue.withAlpha(50),
  //                                             radius: 12,
  //                                             child: SvgPicture.asset(platform.image!, width: 15, height: 15)),
  //                                       ))
  //                                   .toList())
  //                         ],
  //                       ) // Text(project.description.join("\n"), style: const TextStyle(fontSize: 10)),
  //                       ),
  //                   StaggeredGridTile.count(
  //                       crossAxisCellCount: 6,
  //                       mainAxisCellCount: 5,
  //                       child: BulletedList(
  //                         listItems: project.description,
  //                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
  //                         bullet: Icon(Icons.donut_small_sharp, size: 10),
  //                       )),
  //                   StaggeredGridTile.count(
  //                       crossAxisCellCount: 6,
  //                       mainAxisCellCount: 1,
  //                       child: Flex(
  //                         spacing: 10,
  //                         direction: Axis.horizontal,
  //                         children: project.techUsed.map((e) => chip(e.name, e.image)).toList(),
  //                       )),

  //                   // Text(project.description.join("\n"), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
  //                 ],
  //               ),
  //             )),
  //       ),
  //       Positioned(
  //           right: 50,
  //           top: 15,
  //           child: Card(
  //               color: Colors.amberAccent.shade100,
  //               shape: RoundedRectangleBorder(side: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(20)),
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  //                 child: Row(
  //                   spacing: 10,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     if (project.isPersonal == true)
  //                       Icon(Icons.person, size: 15, color: Colors.blue)
  //                     else
  //                       Icon(Icons.factory, size: 15, color: Colors.blue),
  //                     Text(project.isPersonal == true ? "Personal" : project.company, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
  //                   ],
  //                 ),
  //               ))),
  //     ],
  //   );
  // }



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
