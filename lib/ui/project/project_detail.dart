import 'package:atlas_icons/atlas_icons.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/model/projects.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  final void Function() popCall;
  const ProjectDetail({super.key, required this.project, required this.popCall});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: popCall, icon: Icon(Icons.arrow_back))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 13,
          children: [
            Row(spacing: 10, children: [
              project.imageUrl != null
                  ? Padding(padding: const EdgeInsets.all(18.0), child: Image.asset(project.imageUrl!, width: 100, height: 100))
                  : Icon(Atlas.project_presentation, size: 50, color: Colors.black54),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.name, style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600)),
                  Flex(
                      spacing: 10,
                      direction: Axis.horizontal,
                      children: project.platforms
                          .map((platform) => Tooltip(
                                message: platform.name,
                                child: Material(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.orange)),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.blue.withAlpha(50),
                                          radius: 12,
                                          child: SvgPicture.asset(platform.image!, width: 15, height: 15)),
                                      Text(platform.name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                                      const SizedBox(width: 5)
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                ],
              ),
            ]),
            Text("Project details: ", style: TextStyle(fontSize: 15)),
            BulletedList(
              listItems: project.description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              bullet: Icon(Icons.donut_small_sharp, size: 12),
            ),
            Text("Technology used: ", style: TextStyle(fontSize: 15)),
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
}
