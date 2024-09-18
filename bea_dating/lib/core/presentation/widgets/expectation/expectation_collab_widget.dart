

import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ExpectationcolabWidget extends StatelessWidget {
  ExpectationcolabWidget(
      {super.key,
      required this.boxone,
      required this.boxtwo,
      required this.boxthree,
      required this.boxfour,
      required this.boxfive, required this.effectbOne,
      required this.effectbTwo,
      required this.effectbThree,
      required this.effectbFour,
      required this.effectbFive});
  final boxone;
  final boxtwo;
  final boxthree;
  final boxfour;
  final boxfive;
  
  int effectbOne;
  int effectbTwo;
  int effectbThree;
  int effectbFour;
  int effectbFive;
  int blur=0;
  AppFonts appFonts=AppFonts();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          // color: Colors.amber,
          height: mediaqueryHight(.31, context),
          width: mediaqueryWidth(.80, context),
          child: Center(
            child: Row(
              // 1st row
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, bottom: 8, top: 8),
                      child: InkWell(
                        onTap: () => context.read<UserDetailsBloc>().add(
                            ExpectationtButtonSelectionEvent(
                                boxOne: exbuttonGreen,
                                boxTwo: whiteclr,
                                boxThree: whiteclr,
                                boxFour: whiteclr,
                                boxFive: whiteclr,effectbOne:2,effectbTwo:blur,effectbThree: blur,effectbFour: blur,effectbFive: blur,expectation:"Activity partner")),
                        child: Container(
                          height: mediaqueryHight(.055, context),
                          width: mediaqueryWidth(.4, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: boxone,
                              boxShadow: [BoxShadow(blurRadius:2 ,color: blackclr,offset:Offset(0, effectbOne.toDouble()))]),
                       child: Center(child: Text("Activity partner",style: appFonts.ButtonTextblack,)), ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: InkWell(
                        onTap: () => context.read<UserDetailsBloc>().add(
                            ExpectationtButtonSelectionEvent(
                                boxOne: whiteclr,
                                boxTwo: exbuttonGreen,
                                boxThree: whiteclr,
                                boxFour: whiteclr,
                                boxFive: whiteclr,effectbOne:blur,effectbTwo:1,effectbThree: blur,effectbFour: blur,effectbFive: blur,expectation: "Casual dating")),
                        child: Container(
                          height: mediaqueryHight(.055, context),
                          width: mediaqueryWidth(.4, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: boxtwo,
                              boxShadow: [BoxShadow(blurRadius:2 ,color: blackclr,offset:Offset(0, effectbTwo.toDouble()))]),
                        child: Center(child: Text("Casual dating",style: appFonts.ButtonTextblack,)),),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: InkWell( onTap: () => context.read<UserDetailsBloc>().add(
                            ExpectationtButtonSelectionEvent(
                                boxOne: whiteclr,
                                boxTwo: whiteclr,
                                boxThree: exbuttonGreen,
                                boxFour: whiteclr,
                                boxFive: whiteclr,effectbOne:blur,effectbTwo:blur,effectbThree: 2,effectbFour: blur,effectbFive: blur,expectation: "Start a family")),
                        child: Container(
                          height: mediaqueryHight(.13, context),
                          width: mediaqueryWidth(.4, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: boxthree,
                              boxShadow: [BoxShadow(blurRadius:2 ,color: blackclr,offset:Offset(0,effectbThree.toDouble()))]),
                        child: Center(child: Text("Start a family",style: appFonts.ButtonTextblack,)),),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: InkWell( onTap: () => context.read<UserDetailsBloc>().add(
                            ExpectationtButtonSelectionEvent(
                                boxOne: whiteclr,
                                boxTwo: whiteclr,
                                boxThree: whiteclr,
                                boxFour: exbuttonGreen,
                                boxFive: whiteclr,effectbOne:blur,effectbTwo:blur,effectbThree: blur,effectbFour: 2,effectbFive: blur,expectation: "Depends on our connection")),
                        child: Container(
                          height: mediaqueryHight(.195, context),
                          width: mediaqueryWidth(.35, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: boxfour,
                              boxShadow: [BoxShadow(blurRadius:2,color: blackclr,offset:Offset(0,effectbFour.toDouble()))]),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Depends on our connection",style: appFonts.ButtonTextblack,),
                        )),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell( onTap: () => context.read<UserDetailsBloc>().add(
                            ExpectationtButtonSelectionEvent(
                                boxOne: whiteclr,
                                boxTwo: whiteclr,
                                boxThree: whiteclr,
                                boxFour: whiteclr,
                                boxFive: exbuttonGreen,effectbOne:blur,effectbTwo:blur,effectbThree: blur,effectbFour: blur,effectbFive: 2,expectation: "Friends first")),
                        child: Container(
                          height: mediaqueryHight(.055, context),
                          width: mediaqueryWidth(.35, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: boxfive,
                              boxShadow: [BoxShadow(blurRadius:2,color: blackclr,offset:Offset(0,effectbFive.toDouble()))]),
                        child: Center(child: Text("Friends first",style: appFonts.ButtonTextblack,)),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
