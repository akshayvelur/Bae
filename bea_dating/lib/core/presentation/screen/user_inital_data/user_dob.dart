
import 'package:bea_dating/core/presentation/screen/user_inital_data/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/enable_location.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/gender_selection.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserDob extends StatelessWidget {
  UserDob({super.key});
  final _formkey = GlobalKey<FormState>();
  AppFonts appFonts = AppFonts();

  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is NavigateToEnableLocationState) {
            Navigator.of(context)
                .push(FadeTransitionPageRoute(child: EnableLocation()));
          }
              if (state is NavigateToGenderSelectionState) {
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
                    Text("Please fill in your birth date in the",
                        style: appFonts.commonheadfont),
                    SizedBox(
                      height: mediaqueryHight(.01, context),
                    ),
                    Text(
                      "format DD/MM/YYYY",
                      style: appFonts.dateformat,
                    ),
                    SizedBox(
                      height: mediaqueryHight(.02, context),
                    ),
                    Form(
                      key: _formkey,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.datetime,
                        controller: dateController,
                        maxLength: 10,
                        decoration: InputDecoration(
                            labelText: "DD/MM/YYYY",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            counterText: ""),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your Dob";
                          }
                          final dateRegExp = RegExp(
                              r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(19|20)\d{2}$");

                          if (!dateRegExp.hasMatch(value)) {
                            return 'Enter a valid date (DD/MM/YYYY)';
                          }
                          //further validation
                          try {
                            final parts = value.split('/');
                            final day = int.parse(parts[0]);
                            final month = int.parse(parts[1]);
                            final year = int.parse(parts[2]);

                            final date = DateTime(year, month, day);
                            if (date.year != year ||
                                date.month != month ||
                                date.day != day) {
                              return 'Invalid date';
                            }
                          } catch (e) {
                            return 'Invalid date';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.49, context),
                    ),
                    Center(
                      // Navigate to Next page
                      child: GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                                     context.read<UserDetailsBloc>().add(
                              DobToEnableLocationEvent(dob:dateController.text));
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
      ),
    );
  }
}
