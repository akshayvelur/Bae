
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserCoreCollection extends StatelessWidget {
   UserCoreCollection({
    super.key,
    required this.headline,required this.userOut
  });
final headline;
final userOut;
   AppFonts appFonts=AppFonts();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: headline,
          textfont: appFonts.flexhead(whiteclr, size: 14),
        ),
        SizedBox(
      width: mediaqueryWidth(.08, context),
    ),
    SizedBox(
      height: mediaqueryHight(.01, context),
    ),
    Container(
        //width: mediaqueryWidth(100, context),
       // height: mediaqueryHight(.04, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: blackshadow),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommonTextWidget(
            text: userOut,
            textfont: appFonts.flexhead(whiteclr, size: 14),
          ),
        )),],
    );
  }
}
