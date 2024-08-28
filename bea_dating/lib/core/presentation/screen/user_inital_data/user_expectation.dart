import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/presentation_image.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/expectation/expectation_collab_widget.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserExpectationPage extends StatelessWidget {
  UserExpectationPage({super.key});

  AppFonts appFonts = AppFonts();
  Color boxone = whiteclr;
  Color boxtwo = whiteclr;
  Color boxthree = whiteclr;
  Color boxfour = whiteclr;
  Color boxfive = whiteclr;
  var effectbOne = 2;
  var effectbTwo = 2;
  var effectThree = 2;
  var effectFour = 2;
  var effectFive = 2;
  String? expected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<UserDetailsBloc,UserDetailsState>(listener: (context, state) {
          if(state is NavigateToPresentation){
            Navigator.of(context).push(FadeTransitionPageRoute(child: PresentaionImagePage()));
          }
        },
        builder: (context, state) {
            if (state is ExpectationColorSelectedState) {
            boxone = state.boxOne;
            boxtwo = state.boxTwo;
            boxthree = state.boxThree;
            boxfour = state.boxFour;
            boxfive = state.boxFive;
           effectbOne=state.effectbOne;
           effectbTwo=state.effectbTwo;
           effectThree=state.effectbThree;
           effectFour=state.effectbFour;
           effectFive=state.effectbFive;  
           expected=state.expetation;

            print(expected);
          }
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                width: mediaqueryWidth(100, context),
                decoration: BoxDecoration(color: whiteclr),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mediaqueryHight(.05, context),
                        ),
                        // Page back navigation
                        InkWell(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              await Future.delayed(
                                  const Duration(milliseconds: 250));
                              Navigator.pop(context);
                            },
                            child: const Backbuttons()),
                        SizedBox(
                          height: mediaqueryHight(.05, context),
                        ),
                        Text("What are your expectations?",
                            style: appFonts.commonheadfont),
                        SizedBox(
                          height: mediaqueryHight(.03, context),
                        ),
                        ExpectationcolabWidget(
                          boxone: boxone,
                          boxtwo: boxtwo,
                          boxthree: boxthree,
                          boxfour: boxfour,
                          boxfive: boxfive,
                          effectbOne: effectbOne,
                          effectbTwo: effectbTwo,
                          effectbThree: effectThree,
                          effectbFour: effectFour,
                          effectbFive: effectFive,
                        ),
                        SizedBox(
                          height: mediaqueryHight(.24, context),
                        ),
                        Center(
                          // Navigate to Next page
                          child: GestureDetector(
                            onTap: () {
                              if (expected != null) {
                                context
                                    .read<UserDetailsBloc>()
                                    .add(ExeptationToPresentationEvent());
                              }
                            },
                            child: GreenNextbutton(
                              appFonts: appFonts,
                              content: "Next",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
          
        ));
  }
}
// import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
// import 'package:bea_dating/core/presentation/utilit/color.dart';
// import 'package:bea_dating/core/presentation/utilit/fonts.dart';
// import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
// import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
// import 'package:bea_dating/core/presentation/widgets/expectation/expectation_collab_widget.dart';
// import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // ignore: must_be_immutable
// class UserExpectationPage extends StatelessWidget {
//   UserExpectationPage({super.key});

//   AppFonts appFonts = AppFonts();
//   Color boxone = whiteclr;
//   Color boxtwo = whiteclr;
//   Color boxthree = whiteclr;
//   Color boxfour = whiteclr;
//   Color boxfive = whiteclr;
//   var effectbOne = 2;
//   var effectbTwo = 2;
//   var effectThree = 2;
//   var effectFour = 2;
//   var effectFive = 2;
//   String? expected;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
//         builder: (context, state) {
//           if (state is ExpectationColorSelectedState) {
//             boxone = state.boxOne;
//             boxtwo = state.boxTwo;
//             boxthree = state.boxThree;
//             boxfour = state.boxFour;
//             boxfive = state.boxFive;
//            effectbOne=state.effectbOne;
//            effectbTwo=state.effectbTwo;
//            effectThree=state.effectbThree;
//            effectFour=state.effectbFour;
//            effectFive=state.effectbFive;  
//            expected=state.expetation;

//             print(expected);
//           }

           
//           return Scaffold(
//             resizeToAvoidBottomInset: true,
//             body: SingleChildScrollView(
//               child: Container(
//                 width: mediaqueryWidth(100, context),
//                 decoration: BoxDecoration(color: whiteclr),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 12),
//                   child: Center(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: mediaqueryHight(.05, context),
//                         ),
//                         // Page back navigation
//                         InkWell(
//                             onTap: () async {
//                               FocusScope.of(context).unfocus();
//                               await Future.delayed(
//                                   const Duration(milliseconds: 250));
//                               Navigator.pop(context);
//                             },
//                             child: const Backbuttons()),
//                         SizedBox(
//                           height: mediaqueryHight(.05, context),
//                         ),
//                         Text("What are your expectations?",
//                             style: appFonts.commonheadfont),
//                         SizedBox(
//                           height: mediaqueryHight(.05, context),
//                         ),
//                         ExpectationcolabWidget(
//                           boxone: boxone,
//                           boxtwo: boxtwo,
//                           boxthree: boxthree,
//                           boxfour: boxfour,
//                           boxfive: boxfive,
//                           effectbOne: effectbOne,
//                           effectbTwo: effectbTwo,
//                           effectbThree: effectThree,
//                           effectbFour: effectFour,
//                           effectbFive: effectFive,
//                         ),
//                         SizedBox(
//                           height: mediaqueryHight(.26, context),
//                         ),
//                         Center(
//                           // Navigate to Next page
//                           child: GestureDetector(
//                             onTap: () {
//                               if(expected!=null){context
//                                 .read<UserDetailsBloc>()
//                               .add(ExeptationToPresentationEvent());}
//                             },
//                             child: GreenNextbutton(
//                               appFonts: appFonts,
//                               content: "Next",
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
