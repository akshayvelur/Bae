import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/basic_text/basic_text.dart';
import 'package:flutter/material.dart';

class RuleContentWidget extends StatelessWidget {
  const RuleContentWidget({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.5, context),
      width: mediaqueryWidth(.99, context),
      decoration: BoxDecoration(
          color: rulecontainerbclr, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
                appFonts: appFonts,
                headline: "Be yourself.",
                subline:
                    "Make sure your photo,age,and bio are true to who you are."),
            BasicText(
                appFonts: appFonts,
                headline: "Stay safe.",
                subline:
                    "Don't be too quick to give out personal information."),
            BasicText(
                appFonts: appFonts,
                headline: "Play it cool.",
                subline:
                    "Respect others and trear them as you would like to be treated."),
            BasicText(
                appFonts: appFonts,
                headline: "Be proactive.",
                subline: "Always report bad behavior"),
          ],
        ),
      ),
    );
  }
}
