
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mediaqueryHight(.08, context),
        ),
       Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 0),
      child: Text(
        "welcome",
        style: appFonts.welcome,
      ),
    ),  Transform.translate(
      offset: const Offset(0, -15),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(
          "to Bae",
          style: appFonts.welcome,
        ),
      ),
    ), Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        height: mediaqueryHight(.1, context),
        width: mediaqueryWidth(.98, context),
        child: Text(
          """chat get to know each other,and flirt face to face. enjoy safe discreet messaging""",
          style: appFonts.welcomecondent,
          overflow: TextOverflow.clip,
        ),
      ),
    ),  SizedBox(height:mediaqueryHight(.05, context),),],
    );
  }
}
