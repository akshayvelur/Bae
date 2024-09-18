
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class AgreeButton extends StatelessWidget {
  const AgreeButton({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.05, context),
      width: mediaqueryWidth(.86, context),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Color.fromARGB(255, 52, 51, 51),
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 1))
          ]),
      child: Center(
          child: Text(
        "I agree",
        style: appFonts.nextbuttongreen,
      )),
    );
  }
}
