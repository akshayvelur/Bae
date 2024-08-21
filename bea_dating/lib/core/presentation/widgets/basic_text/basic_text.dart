import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class BasicText extends StatelessWidget {
  BasicText({
    super.key,
    required this.appFonts,required this.headline,required this.subline
  });
  String headline;
  String subline;
  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           SizedBox(
                height: mediaqueryHight(.03, context),
              ),
        Text(
          headline,
          style: appFonts.rulesheadline,
        ), Text(
                subline,
                style: appFonts.rulesubline,
              )
      ],
    );
  }
}