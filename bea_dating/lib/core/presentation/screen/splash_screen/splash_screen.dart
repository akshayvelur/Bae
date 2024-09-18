import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/bottom_navigation/bottom_navigator.dart.dart';
import 'package:bea_dating/core/presentation/screen/welcome&rule/welcome_screen.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<UserDetailsBloc>().add(SplashToWelcomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        if (state is NavigationToWelcomscreenState) {
          Navigator.of(context)
              .pushReplacement(FadeTransitionPageRoute(child: WelcomeScreen()));
        }
        if (state is AccountVarifiedState) {
          Navigator.of(context).pushReplacement(
              FadeTransitionPageRoute(child: BottomNavigationScreen()));
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: splashclr),
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Bae",
                  textStyle: Logo,
                  speed: Duration(milliseconds: 250),
                )
              ],
              totalRepeatCount: 1,
            ),
          ),
        ),
      ),
    );
  }
}
