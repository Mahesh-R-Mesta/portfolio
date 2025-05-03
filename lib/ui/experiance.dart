import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/animations/swing_board.dart';
import 'package:myportfolio/animations/tech_stack.dart';
import 'package:myportfolio/constant/string_constant.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';
import 'package:myportfolio/widget/text_tile.dart';

class Experience extends StatelessWidget {
  static const String name = "/experience";
  static const String tag = "exp";

  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final controller = ScrollController();

    List<CompanyInfo> experience = [StringConst.codeMatrix, StringConst.geekSynergy, StringConst.appBee];

    Widget experienceCard(CompanyInfo company) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company.company, style: theme.labelLarge?.copyWith(color: Colors.orange, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            Text('${company.role} • ${company.startAndEnd}', style: theme.labelSmall),
            const SizedBox(height: 10),
            Text(company.details, style: theme.bodyMedium),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(serialNo: "02", title: "Experience"),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                    trackColor: WidgetStatePropertyAll(Colors.black12),
                    thumbColor: WidgetStatePropertyAll(Colors.transparent),
                  )),
                  child: DraggableScrollbar.rrect(
                    backgroundColor: Colors.orangeAccent.shade100,
                    controller: controller,
                    child: ListView.builder(
                        controller: controller,
                        itemCount: experience.length,
                        itemBuilder: (ctx, index) {
                          return SwingBoardAnimation(child: experienceCard(experience[index]));
                        }),
                  ),
                ),
              ),
              Flexible(child: TechStackAnime())
            ],
          )),
    );
  }
}
