import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myContainer extends StatelessWidget {
   myContainer({
    super.key,
    //required this.title
  });
// String title;
 AppFonts appFonts=AppFonts();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.035, context),
      width: mediaqueryWidth(.4, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:const Color.fromARGB(132, 48, 47, 45),
      ),child: Text("title",style: appFonts.flextext(blackclr,Fweight: 400,size: 14),),
    );
  }
}
