import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/username_data.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/basic_text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RulesAndRegulation extends StatelessWidget {
  RulesAndRegulation({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        if (state is NavigateToNameFormState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UserName()));
        }
      },
      child: Scaffold(
        body: Container(
          height: mediaqueryHight(100, context),
          width: mediaqueryWidth(100, context),
          decoration: BoxDecoration(gradient: splashclr),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaqueryHight(.14, context),
                ),
                Text(
                  "Bae",
                  style: Logo,
                ),
                SizedBox(
                  height: mediaqueryHight(.04, context),
                ),
                Text(
                  "please follow these House Rules.",
                  style: appFonts.rulesubline,
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Container(
                  height: mediaqueryHight(.5, context),
                  width: mediaqueryWidth(.99, context),
                  decoration: BoxDecoration(
                      color: rulecontainerbclr,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BasicText(
                            appFonts: appFonts,
                            headline: "Be yourself.",
                            subline:
                                "Make sure your photo,age,and bio are true to who you are."),
                        BasicText(
                            appFonts: appFonts,
                            headline: "Stay safe.",
                            subline:
                                "Don't be too quick to give out personal information."),
                        BasicText(
                            appFonts: appFonts,
                            headline: "Play it cool.",
                            subline:
                                "Respect others and trear them as you would like to be treated."),
                        BasicText(
                            appFonts: appFonts,
                            headline: "Be proactive.",
                            subline: "Always report bad behavior"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaqueryHight(.10, context),
                ),
                Center(
                  // Navigate to Next page
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<UserDetailsBloc>()
                          .add(RuleToNameformEvent());
                    },
                    child: Container(
                      height: mediaqueryHight(.05, context),
                      width: mediaqueryWidth(.86, context),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                color: Color.fromARGB(255, 52, 51, 51),
                                blurStyle: BlurStyle.outer,
                                offset: Offset(0, 1))
                          ]),
                      child: Center(
                          child: Text(
                        "I agree",
                        style: appFonts.nextbuttongreen,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
