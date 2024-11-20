// ignore_for_file: unnecessary_null_comparison

import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myContainer extends StatelessWidget {
  myContainer({super.key, required this.title});
  String title;
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: mediaqueryHight(.035, context),
      width: mediaqueryWidth(.4, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: blackTransparent,
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          title != null ? title : " ",
          style: appFonts.flextext(whiteclr, Fweight: 700, size: 14),
          softWrap: true,
        ),
      )),
    );
  }
}
