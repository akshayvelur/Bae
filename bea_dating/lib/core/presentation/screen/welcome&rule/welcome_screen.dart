import 'package:bea_dating/core/domin/usecase/authentication.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/rules_and_regulation.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/welcome_screen_widgets/googe_login_button_widget.dart';
import 'package:bea_dating/core/presentation/widgets/welcome_screen_widgets/welcome_collab_containers_widget.dart';
import 'package:bea_dating/core/presentation/widgets/welcome_screen_widgets/welcome_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AppFonts appFonts = AppFonts();
  Authentic authentic = Authentic();
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        if (state is InitLodingSate) {
        } else if (state is NavigationToRuleState) {
          Navigator.of(context).pop();

          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: RulesAndRegulation()));
        } else if (state is NavigateToHomeScreenState) {
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: BottomNavigationScreen()));
        }
      },
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            //color:  Color.fromARGB(255, 149, 68, 92)
            gradient: welcomebclr),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const WelcomeColabergWidget(),
            WelcomeMessageWidget(appFonts: appFonts),
            GoogleLoginButtonWidget(appFonts: appFonts),
            // SizedBox(
            //   height: mediaqueryHight(.02, context),
            //   // Loging OnTap
            // ),
            // Center(
            //     child: GestureDetector(
            //         behavior: HitTestBehavior.opaque,
            //         onTap: () {
            //      context.read<UserDetailsBloc>().add(AccountCheckingEvent());
            //         },
            //         child: Text(
            //           "Already have a member? Login",
            //           style: appFonts.nextbuttonwhite,
            //         )))
          ],
        ),
      )),
    );
  }
}
