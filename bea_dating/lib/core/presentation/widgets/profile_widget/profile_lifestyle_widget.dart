
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/text_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/user_core_cl_Widgets.dart';
import 'package:flutter/material.dart';

class LifeStyleWidget extends StatelessWidget {
  const LifeStyleWidget({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaqueryWidth(100, context),
      height: mediaqueryHight(.33, context),
      decoration: BoxDecoration(
        color: useraboutContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
              text: "Lifestyle habit",
              textfont: appFonts.flexhead(blackclr, size: 20),
            ),
            SizedBox(
              height: mediaqueryHight(.02, context),
            ),
            UserCoreCollection(
              headline: "How often do you drink?",
              userOut: "Socially on  weekends",
            ),
            SizedBox(
              height: mediaqueryHight(.01, context),
            ),
            UserCoreCollection(
              headline: "How often do you smoke?",
              userOut: "No-smoker",
            ),
            SizedBox(
              height: mediaqueryHight(.01, context),
            ),
            UserCoreCollection(
              headline: "Do you workout?",
              userOut: "Everyday",
            ),
          ],
        ),
      ),
    );
  }
}
