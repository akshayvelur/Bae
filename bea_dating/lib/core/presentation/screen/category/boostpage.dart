import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoostPage extends StatelessWidget {
 BoostPage({super.key});
 AppFonts appFonts=AppFonts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFFCC80),body:Padding(
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 300,top: 35),
          child:
           TextButton(onPressed: (){}, child:Image.asset("assets/icons8-cancel-100.png",scale: 2,)),
          
        ),Text("Boots",style:appFonts.flextext(blackclr,size: 20,Fweight: 500),)],),
    ));
  }
}