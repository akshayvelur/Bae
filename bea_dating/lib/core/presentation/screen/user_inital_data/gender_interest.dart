import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/user_expectation.dart';

import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/gender_widget/gender_widgets.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GenderInterestPage extends StatelessWidget {
  GenderInterestPage({super.key});

  AppFonts appFonts = AppFonts();
  Color menclr = whiteclr;
  Color women = whiteclr;
  Color other = whiteclr;
  String? interested;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<UserDetailsBloc, UserDetailsState>(
          listener: (context, state) {
          if (state is NavigateToExpectationState) {
              Navigator.of(context).push(FadeTransitionPageRoute(child: UserExpectationPage()));
            }
          },
          builder: (context, state) {
            if (state is InterestColorSelectedState) {
              menclr = state.menclr;
              women = state.womenclr;
              other = state.everyoneclr;
              interested = state.genderInterest;
              print(interested);
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
                          Text("Who are You interested in seeing?",
                              style: appFonts.commonheadfont),
                          SizedBox(
                            height: mediaqueryHight(.05, context),
                          ),
                          // women Gender container
                          InterestWidgetTwo(
                              women: women, appFonts: appFonts, cat: "Women"),
                          SizedBox(
                            height: mediaqueryHight(.02, context),
                          ),
                          // men Gender container
                          InterestWidgetOne(
                              menclr: menclr, appFonts: appFonts, cat: "Men"),
                          SizedBox(
                            height: mediaqueryHight(.02, context),
                          ),
                          // Other Gender container
                          InterestWidgetThree(
                              other: other,
                              appFonts: appFonts,
                              cat: "Everyone"),
                          SizedBox(
                            height: mediaqueryHight(.37, context),
                          ),
                          Center(
                            // Navigate to Next page
                            child: GestureDetector(
                              onTap: () {
                                if (interested != null) {
                                  context
                                      .read<UserDetailsBloc>()
                                      .add(InterestToExpectationEvent(interest:interested.toString() ));
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
