import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/gender_selection.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

// ignore: must_be_immutable
class EnableLocation extends StatelessWidget {
  EnableLocation({super.key});

  AppFonts appFonts = AppFonts();
  String location = "mylocation";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is NavigateToGenderSelectionState) {
            //  log("Navigate to genderselct");
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: GenderSelctionPage()));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              width: mediaqueryWidth(100, context),
              decoration: BoxDecoration(color: whiteclr),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                    Container(
                      width: mediaqueryWidth(100, context),
                      height: mediaqueryHight(.21, context),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/gmap-tutorial-google-map-provider.jpg"),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(197, 0, 0, 0),
                                blurRadius: 5)
                          ]),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.01, context),
                    ),
                    Text("Find the people you cross path with",
                        style: appFonts.commonheadfont),
                    SizedBox(
                      height: mediaqueryHight(.01, context),
                    ),
                    Text(
                      'Select "Always allow" so we can introduce you to your future Crushes.your exact location is never revealed to other happeners.',
                      style: appFonts.dateformat,
                    ),
                    SizedBox(
                      height: mediaqueryHight(.3, context),
                    ),
                    Center(
                      // Navigate to Next page
                      child: GestureDetector(
                        onTap: () { 
                          context.read<UserDetailsBloc>().add(
                              EnableLocationToGenderselectEvent(
                                  ));
                        },
                        child: GreenNextbutton(
                          appFonts: appFonts,
                          content: "Enable location",
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
