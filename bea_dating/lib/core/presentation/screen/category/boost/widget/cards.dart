
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class CardThree extends StatelessWidget {
  const CardThree({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mediaqueryHight(.26, context),
        width: mediaqueryWidth(.27, context),
        decoration: BoxDecoration(
            color: const Color.fromARGB(140, 211, 192, 192),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: blackclr,
                  blurRadius: 2)
            ]),
     child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,children: [ 
      SizedBox(height: mediaqueryHight(.047, context),),Text(
              "1",
              style: appFonts.cardCount,
            ),
            Text(
              "Boosts",
              style: appFonts.flextext(blackclr,
                  size: 16, Fweight: 700),
            ),
            Text(
              "₹ 89.00",
              style: appFonts.flextext(blackclr,
                  size: 16, Fweight: 700),
            ),],), ),
    );
  }
}

class CardTwo extends StatelessWidget {
  const CardTwo({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mediaqueryHight(.26, context),
        width: mediaqueryWidth(.27, context),
        decoration: BoxDecoration(
            color: blackclr,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: blackclr,
                  blurRadius: 2)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,children: [
           SizedBox(height: mediaqueryHight(.012, context),),
          Container(height: mediaqueryHight(.03, context),width: mediaqueryWidth(.18, context),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),child: Center(child: Text("popular",style: appFonts.flextext(blackclr,size: 13),)),)
        ,  Text(
              "3",
              style: appFonts.cardCountWhite,
            ), Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
                "Boosts",
                style: appFonts.flextext(whiteclr,
                    size: 16, Fweight: 700),
              ),
              
        ),  Text(
              "₹ 189.00",
              style: appFonts.flextext(whiteclr,
                  size: 16, Fweight: 700),
            ),
             SizedBox(
              height: 10,
            ),
             Container(
              width: mediaqueryWidth(.10, context),
              height: mediaqueryHight(.05, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: whiteclr),
            child: Center(child: Text("40%",style: appFonts.flextext(blackclr,size: 13),)),)],),
      ),
    );
  }
}
class CardOne extends StatelessWidget {
  const CardOne({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mediaqueryHight(.26, context),
        width: mediaqueryWidth(.27, context),
        decoration: BoxDecoration(
            color: const Color.fromARGB(140, 211, 192, 192),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: blackclr,
                  blurRadius: 2)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "10",
              style: appFonts.cardCount,
            ),
            Text(
              "Boosts",
              style: appFonts.flextext(blackclr,
                  size: 16, Fweight: 700),
            ),
            Text(
              "₹ 475.00",
              style: appFonts.flextext(blackclr,
                  size: 16, Fweight: 700),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: mediaqueryWidth(.10, context),
              height: mediaqueryHight(.05, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: blackclr),
            child: Center(child: Text("40%",style: appFonts.flextext(whiteclr,size: 13),)),)
          ],
        ),
      ),
    );
  }
}
