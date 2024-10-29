import 'package:bea_dating/core/presentation/screen/category/boost/widget/cards.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BoostPage extends StatelessWidget {
  BoostPage({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFCC80),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 300, top: 35),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons8-cancel-100.png",
                      scale: 2,
                    )),
              ),
              Text(
                "Boots",
                style: appFonts.flextext(blackclr, size: 28, Fweight: 700),
              ),
              Container(
                height: mediaqueryHight(.065, context),
                width: mediaqueryWidth(.13, context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: blackclr,
                    image: DecorationImage(
                      image: AssetImage("assets/icons8-power-48.png"),
                      scale: 1.5,
                    )),
              ),
              SizedBox(
                height: mediaqueryHight(.04, context),
              ),
              Text(
                "Boost your profile",
                style: appFonts.flextext(blackclr, Fweight: 700, size: 23),
              ),
              SizedBox(
                height: mediaqueryHight(.03, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Multiply your changes of being liked and",
                  style: appFonts.flextext(blackclr, Fweight: 300, size: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text("get more Crushes!",
                    style: appFonts.flextext(blackclr, Fweight: 300, size: 18)),
              ),
              SizedBox(
                height: mediaqueryHight(.03, context),
              ),
              Row(
                children: [
                  // card one
                  InkWell(
                      onTap: () {},
                      splashColor: const Color.fromARGB(162, 125, 96, 139),
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(child: CardOne(appFonts: appFonts))),
                  // card two
                  InkWell(
                      onTap: () {},
                      splashColor: const Color.fromARGB(162, 125, 96, 139),
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(child: CardTwo(appFonts: appFonts))),
                  // card three
                  InkWell(
                      onTap: () {},
                      splashColor: const Color.fromARGB(162, 125, 96, 139),
                      borderRadius: BorderRadius.circular(10),
                      child: Ink(child: CardThree(appFonts: appFonts)))
                ],
              )
            ],
          ),
        ));
  }
}
