
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart' show BlurStyle, BorderRadius, BoxDecoration, BoxShadow, BuildContext, Center, Color, Container, Radius, StatelessWidget, Text, Widget;

// ignore: must_be_immutable
class GreenNextbutton extends StatelessWidget {
  GreenNextbutton({
    super.key,
    required this.appFonts,required this.content
    
  });

  final AppFonts appFonts;
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
     height: mediaqueryHight(.05, context),
     width: mediaqueryWidth(.86, context),
     decoration: const BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(30)),
         color:Color(0xFF386553),
         boxShadow: [
           BoxShadow(
               blurRadius: 2,
               color: Color.fromARGB(255, 21, 20, 20),
               blurStyle: BlurStyle.outer,
               )
         ]),
     child: Center(
         child: Text(
      content,
       style: appFonts.nextbuttonwhite,
     )),
                        );
  }
}
