import 'package:atlas_icons/atlas_icons.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/model/projects.dart';
import 'package:myportfolio/services/launch.dart';
import 'package:myportfolio/util/extension/context.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  final void Function() popCall;
  const ProjectDetail({super.key, required this.project, required this.popCall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: popCall, icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(spacing: 10, children: [
              project.imageUrl != null
                  ? Padding(padding: const EdgeInsets.all(18.0), child: Image.asset(project.imageUrl!, width: 100, height: 100))
                  : Icon(Atlas.project_presentation, size: 50, color: Colors.black54),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: context.flexAxis(),
                    spacing: 10,
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: context.isPortrait ? context.screenWidth * 0.5 : double.infinity),
                          child: Text(project.name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600))),
                      if (project.isPersonal == true)
                        Material(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Personal", style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                    ],
                  ),
                  Flex(spacing: 12, direction: Axis.horizontal, children: project.links.map((link) => linkButton(link)).toList())
                  // Flex(
                  //     spacing: 10,
                  //     direction: Axis.horizontal,
                  //     children: project.platforms
                  //         .map((platform) => Tooltip(
                  //               message: platform.name,
                  //               child: Material(
                  //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.orange)),
                  //                 child: Row(
                  //                   spacing: 5,
                  //                   children: [
                  //                     CircleAvatar(
                  //                         backgroundColor: Colors.blue.withAlpha(50),
                  //                         radius: 12,
                  //                         child: SvgPicture.asset(platform.image!, width: 15, height: 15)),
                  //                     Text(platform.name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  //                     const SizedBox(width: 5)
                  //                   ],
                  //                 ),
                  //               ),
                  //             ))
                  //         .toList()),
                ],
              ),
            ]),
            Text("Available Platform: ", style: TextStyle(fontSize: 15)),
            Flex(
                spacing: 10,
                direction: Axis.horizontal,
                children: project.platforms
                    .map((platform) => Tooltip(
                          message: platform.name,
                          child: Material(
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              spacing: 5,
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.blue.withAlpha(50),
                                    radius: 12,
                                    child: SvgPicture.asset(platform.image!, width: 15, height: 15)),
                                Text(platform.name, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                                const SizedBox(width: 5)
                              ],
                            ),
                          ),
                        ))
                    .toList()),
            Text("Project Details: ", style: TextStyle(fontSize: 15)),
            BulletedList(
              listItems: project.description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              bullet: Icon(Icons.donut_small_sharp, size: 12),
            ),
            Text("Technology Used: ", style: TextStyle(fontSize: 15)),
            Flex(spacing: 10, direction: Axis.horizontal, children: project.techUsed.map((e) => chip(e.name, e.image)).toList())
          ],
        ),
      ),
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

  Widget linkButton(Link link) {
    return InkWell(
      onTap: () => openLink(link.url),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          if (link.image != null) SvgPicture.asset(link.image!, width: 15, height: 15),
          Text(
            link.name,
            style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
