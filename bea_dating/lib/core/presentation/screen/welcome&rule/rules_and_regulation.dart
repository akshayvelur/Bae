import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/username_data.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/rule_widget/agree_button_widget.dart';
import 'package:bea_dating/core/presentation/widgets/rule_widget/rule_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RulesAndRegulation extends StatelessWidget {
  RulesAndRegulation({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        if (state is NavigateToNameFormState) {
          Navigator.of(context)
              .push(FadeTransitionPageRoute(child: UserName()));
        }
      },
      child: Scaffold(
        body: Container(
          height: mediaqueryHight(100, context),
          width: mediaqueryWidth(100, context),
          decoration: BoxDecoration(gradient: splashclr),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaqueryHight(.14, context)
                ),
                Text(
                  "Bae",
                  style: Logo,
                ),
                SizedBox(
                  height: mediaqueryHight(.04, context)
                ),
                Text(
                  "please follow these House Rules.",
                  style: appFonts.rulesubline,
                ),
                SizedBox(height: mediaqueryHight(.01, context)),
                RuleContentWidget(appFonts: appFonts),
                SizedBox(height: mediaqueryHight(.10, context)),
                Center(
                  // Navigate to Next page
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<UserDetailsBloc>()
                          .add(RuleToNameformEvent());
                    },
                    child: AgreeButton(appFonts: appFonts),
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
