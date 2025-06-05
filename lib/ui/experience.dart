import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myportfolio/animations/online.dart';
import 'package:myportfolio/animations/slide_animation.dart';
import 'package:myportfolio/animations/tech_stack.dart';
import 'package:myportfolio/services/launch.dart';
import 'package:myportfolio/util/animation_helper.dart';
import 'package:myportfolio/util/constant/string_constant.dart';
import 'package:myportfolio/util/extension/context.dart';
import 'package:myportfolio/widget/custom_app_bar.dart';

class Experience extends StatelessWidget {
  static const String name = "/experience";
  static const String tag = "exp";
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ScrollController>();

    List<CompanyInfo> experience = [StringConst.codeMatrix, StringConst.geekSynergy, StringConst.appBee];

    return SizedBox(
      height: context.screenHeight * context.device(1.2, 1.65),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: context.flexAxis(),
          children: [
            Expanded(
              child: Column(spacing: 6, children: [
                CustomSlideFadeAnimation(
                    controller: controller,
                    position: context.device(720, 1000),
                    range: 230,
                    translate: 300,
                    fadeCurve: AnimationHelper.square,
                    child: CustomAppBar(title: "Experience")),
                ...List.generate(experience.length, (index) {
                  return CustomSlideFadeAnimation(
                      controller: controller,
                      position: context.device(720, 1000) + (index * context.device(150, 200)),
                      range: 230,
                      translate: 300,
                      direction: AxisDirection.up,
                      fadeCurve: AnimationHelper.exponent,
                      child: ExperienceCard(company: experience[index]));
                })
              ]),
            ),
            // Flexible(
            //     fit: isMobile() ? FlexFit.loose : FlexFit.loose,
            //     child:
            Builder(builder: (context) {
              return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final value = AnimationHelper.scrollPortion(controller, context.device(750, 1890), 300);
                    return Transform.scale(scale: value, child: child); //offset: Offset(400 - value * 400, 0)
                  },
                  child: TechStackAnime());
            })
            // )
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
          for (final detail in company.details) Text(detail, style: theme.bodyMedium),
        ],
      ),
    );
  }
}
