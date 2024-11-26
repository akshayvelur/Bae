import 'package:bea_dating/core/presentation/screen/home_screen/filter_Page/discovery_settings.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';

AppBar HomePageAppBar(BuildContext context, int boost, AppFonts appfont) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      "Bae",
      style: subLogoblack,
    ),
    backgroundColor: Colors.transparent,
    actions: [
      Container(
          height: mediaqueryHight(.05, context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 241, 239, 241),
              boxShadow: [BoxShadow(blurRadius: .3, color: blackTransparent)]),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Image.asset("assets/icons8-lightning-100.png",scale: 2,),
                Text(
                  "${boost}",
                  style: appfont.flextext(blackclr, Fweight: 600, size: 14),
                ),
              ],
            ),
          ))),
      SizedBox(width: mediaqueryWidth(.03, context)),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: DiscoverySettings()));
        },
        child: Image.asset(
          "assets/icons8-filter-100.png",
          color: blackclr,
          scale: 4.4,
        ),
      )
    ],
  );
}
