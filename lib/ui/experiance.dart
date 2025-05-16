import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myportfolio/animations/tech_stack.dart';
import 'package:myportfolio/constant/string_constant.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

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
      return InkWell(
        hoverColor: Colors.blue.shade100.withAlpha(50),
        highlightColor: Colors.orange.shade100.withAlpha(50),
        radius: 50,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                  TextSpan(
                      text: company.company,
                      children: [TextSpan(text: " • (${company.city})", style: theme.labelSmall?.copyWith(fontSize: 13, fontFamily: Family.orbit))]),
                  style: theme.labelLarge?.copyWith(color: Colors.orange, fontWeight: FontWeight.w500)),
              const SizedBox(height: 5),
              Text('${company.role} • ${company.startAndEnd}', style: theme.labelSmall),
              const SizedBox(height: 10),
              Text(company.details, style: theme.bodyMedium),
            ],
          ),
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
                  )),
                  child: AnimationLimiter(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: experience.length,
                        itemBuilder: (ctx, index) {
                          return AnimationConfiguration.staggeredList(
                              duration: Duration(milliseconds: 1500),
                              delay: Duration(milliseconds: 700),
                              position: index,
                              child: SlideAnimation(
                                  verticalOffset: 100,
                                  child: FadeInAnimation(
                                    child: experienceCard(experience[index]),
                                  ))); //SwingBoardAnimation(child: );
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
