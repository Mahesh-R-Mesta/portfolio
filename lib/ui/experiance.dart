import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolio/animations/online.dart';
import 'package:myportfolio/animations/tech_stack.dart';
import 'package:myportfolio/util/animation_helper.dart';
import 'package:myportfolio/util/constant/string_constant.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Experience extends StatelessWidget {
  static const String name = "/experience";
  static const String tag = "exp";
  final ScrollController controller;
  const Experience({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    // final controller = ScrollController();

    List<CompanyInfo> experience = [StringConst.codeMatrix, StringConst.geekSynergy, StringConst.appBee];

    return SizedBox(
      height: ScreenUtil().screenHeight * 1.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Column(spacing: 6, children: [
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final value = AnimationHelper.scrollPortion(controller, 720, 200);
                      return FadeTransition(
                          key: ValueKey(experience),
                          opacity: AnimationHelper.square(value),
                          child: Transform.translate(offset: Offset(0, 300 - value * 300), child: child));
                    },
                    child: CustomAppBar(serialNo: "", title: "Experience")),
                ...List.generate(experience.length, (index) {
                  return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        final value = AnimationHelper.scrollPortion(controller, 720 + (index * 120), 200);
                        return FadeTransition(
                            key: ValueKey(experience),
                            opacity: AnimationHelper.exponent(value),
                            child: Transform.translate(offset: Offset(0, 300 - value * 300), child: child));
                      },
                      child: ExperienceCard(company: experience[index]));
                })
              ]),
            ),
            Flexible(
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final value = AnimationHelper.scrollPortion(controller, 720, 200);
                      return Transform.scale(scale: value, child: child); //offset: Offset(400 - value * 400, 0)
                    },
                    child: TechStackAnime())
                // .animate()
                // .fade(duration: AnimeConfig.mediumDuration)
                // .slideX(duration: AnimeConfig.mediumDuration, begin: 0.5, end: 0)
                )
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final CompanyInfo company;
  const ExperienceCard({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text.rich(
                  TextSpan(
                      text: company.company,
                      children: [TextSpan(text: " • (${company.city})", style: theme.labelSmall?.copyWith(fontSize: 13, fontFamily: Family.orbit))]),
                  style: theme.labelLarge?.copyWith(color: Colors.orange, fontWeight: FontWeight.w500)),
              if (company.current) Online(enable: true)
            ],
          ),
          const SizedBox(height: 5),
          Text('${company.role} • ${company.startAndEnd}', style: theme.labelSmall),
          const SizedBox(height: 10),
          Text(company.details, style: theme.bodyMedium),
        ],
      ),
    );
  }
}
