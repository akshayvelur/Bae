import 'dart:math';
import 'dart:developer';
import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/enable_location.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelctionPage extends StatelessWidget {
  GenderSelctionPage({super.key});

  AppFonts appFonts = AppFonts();
  Color menclr = Colors.white;
  Color women = Colors.white;
  Color other = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is GenderColorSelectedState) {
           
           women=state.womenclr;
           menclr=state.menclr;
           other=state.Otherclr;
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              height: mediaqueryHight(100, context),
              width: mediaqueryWidth(100, context),
              decoration: BoxDecoration(gradient: userbasicbclr),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
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
                    Text("What's your gender?", style: appFonts.commonheadfont),
                    SizedBox(
                      height: mediaqueryHight(.05, context),
                    ),

                    InkWell(
                      onTap: () {
                      context.read<UserDetailsBloc>().add(GenderButtonSelctionEvent(menclr:Colors.white, Otherclr: Colors.white, womenclr: Colors.black));
                      },
                      child: Container(
                        height: mediaqueryHight(.05, context),
                        width: mediaqueryWidth(100, context),
                        decoration: BoxDecoration(
                            color: women,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 2)
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.02, context),
                    ),
                    InkWell(onTap: (){ 
                      // women=Colors.white;
                      // menclr=Colors.black;
                      // other=Colors.white; 
                      },
                      child: Container(
                        height: mediaqueryHight(.05, context),
                        width: mediaqueryWidth(100, context),
                        decoration: BoxDecoration(
                            color: menclr,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 2)
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.02, context),
                    ),
                    InkWell(onTap: (){ 
                      // women=Colors.white;
                      // menclr=Colors.white;
                      // other=Colors.black; 
                      },
                      child: Container(
                        height: mediaqueryHight(.05, context),
                        width: mediaqueryWidth(100, context),
                        decoration: BoxDecoration(
                            color: other,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 2)
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.41, context),
                    ),
                    Center(
                      // Navigate to Next page
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<UserDetailsBloc>()
                              .add(DobToEnableLocationEvent());
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
      ),
    );
  }
}
