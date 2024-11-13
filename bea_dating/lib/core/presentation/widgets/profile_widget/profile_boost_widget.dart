
import 'package:animated_loading_border/animated_loading_border.dart';
import 'package:bea_dating/core/presentation/screen/category/boost/boostpage.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';

import '../../utilit/fonts.dart';

class ProfileBoostWidget extends StatelessWidget {
  const ProfileBoostWidget({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: AnimatedLoadingBorder(borderColor: Color.fromARGB(255, 13, 208, 62),cornerRadius: 10,borderWidth: 6,duration: Duration(seconds: 3
      ),
        child: InkWell(onTap: () {
          Navigator.of(context).push(FadeTransitionPageRoute(child:BoostPage() ));
        },
          child: Container(
            height: mediaqueryHight(.045, context),
            width: mediaqueryHight(.13, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blackclr,
              boxShadow: [
                BoxShadow(
                    color: blackshadow,
                    blurRadius: 2,
                    offset: Offset(2, 0),
                    blurStyle: BlurStyle.normal)
              ],
            ),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 10),
                    child:Image.asset("assets/icons8-flash-48.png",scale: 3,)
                  ),
                  Text(
                    "Boost",
                    style: appFonts.flextext(whiteclr,size: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
