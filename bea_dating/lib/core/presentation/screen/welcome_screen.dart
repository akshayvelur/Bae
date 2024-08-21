import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/rules_and_regulation.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/welcome_screen_widgets/welcome_collab_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<UserDetailsBloc,UserDetailsState>(listener: (context, state) {
        if(state is NavigationToRuleState ){
          Navigator.of(context).push(MaterialPageRoute(builder:(context) => RulesAndRegulation()));
        }
      },
        child: Scaffold(
            body: Container(
          decoration: BoxDecoration(gradient: welcomebclr),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const WelcomeColaberg(),
              SizedBox(
                height: mediaqueryHight(.05, context),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 0),
                child: Text(
                  "welcome",
                  style: appFonts.welcome,
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -15),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "to Bae",
                    style: appFonts.welcome,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  height: mediaqueryHight(.1, context),
                  width: mediaqueryWidth(.98, context),
                  child: Text(
                    """chat get to know each other,and flirt face to face. enjoy safe discreet messageing""",
                    style: appFonts.welcomecondent,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              Center(
        // Navigate to Next page 
                child: GestureDetector(onTap: () {
                 context.read<UserDetailsBloc>().add(WelcomeToRulePageEvent());
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
                              color: Color.fromARGB(255, 0, 0, 0),
                              blurStyle: BlurStyle.outer,
                              offset: Offset(0, 1))
                        ]),
                    child: Center(
                        child: Text(
                      "Join now",
                      style: appFonts.nextbuttongreen,
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: mediaqueryHight(.02, context),
        // Loging OnTap
              ),
              Center(
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Text(
                        "Already have a member? Login",
                        style: appFonts.nextbuttonwhite,
                      )))
            ],
          ),
        )),
      ),
    );
  }
}
