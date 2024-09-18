
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class TopScrollWidget extends StatelessWidget {
  const TopScrollWidget({
    super.key,
    required this.cat,
    required this.appFonts,
  });

  final Map<String, String> cat;
  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.16, context),
      width: mediaqueryWidth(100, context),
      // color: blackshadow,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 1, right: 16, top: 5),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: mediaqueryHight(.12, context),
                    width: mediaqueryWidth(.20, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blackshadow,
                        image: DecorationImage(
                            image: AssetImage(
                              cat.values.elementAt(index),
                            ),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: blackclr, blurRadius: 2)
                        ]),
                  ),
                  SizedBox(
                    height: mediaqueryHight(.001, context),
                  ),
                  Text(
                    cat.keys.elementAt(index),
                    style:
                        appFonts.flextext(blackclr, size: 13),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
