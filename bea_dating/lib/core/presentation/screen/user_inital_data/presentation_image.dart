import 'package:bea_dating/core/presentation/block/user_details_bloc.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/enable_location.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:bea_dating/core/presentation/widgets/userintroduction/User_greenbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PresentaionImagePage extends StatelessWidget {
  PresentaionImagePage({super.key});

  AppFonts appFonts = AppFonts();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener<UserDetailsBloc, UserDetailsState>(
        listener: (context, state) {
          if (state is NavigateToEnableLocationState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EnableLocation()));
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
                    Text("it's all about presentation.",
                        style: appFonts.commonheadfont),
                    SizedBox(
                      height: mediaqueryHight(.09, context),
                    ),
                    Center(
                      child: Container(
                       // color: Colors.amber,
                        height: mediaqueryHight(.36, context),
                        width: mediaqueryWidth(.82, context),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 20,
                                  ),
                                  child: Container(
                                    height: mediaqueryHight(.14, context),
                                    width: mediaqueryWidth(.32, context),
                                    decoration: BoxDecoration(
                                        color: whiteclr,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: blackclr, blurRadius: 2)
                                        ]),
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                  ),
                                  child: Container(
                                    height: mediaqueryHight(.14, context),
                                    width: mediaqueryWidth(.32, context),
                                    decoration: BoxDecoration(
                                        color: whiteclr,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: blackclr, blurRadius: 2)
                                        ]),
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 30,
                                  ),
                                  child: Container(
                                    height: mediaqueryHight(.14, context),
                                    width: mediaqueryWidth(.32, context),
                                    decoration: BoxDecoration(
                                        color: whiteclr,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: blackclr, blurRadius: 2)
                                        ]),
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    left: 30,
                                  ),
                                  child: Container(
                                    height: mediaqueryHight(.14, context),
                                    width: mediaqueryWidth(.32, context),
                                    decoration: BoxDecoration(
                                        color: whiteclr,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: blackclr, blurRadius: 2)
                                        ]),
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: mediaqueryHight(.2, context),
                    ),
                    Center(
                      // Navigate to Next page
                      child: GestureDetector(
                        onTap: () {
                          // context
                          //     .read<UserDetailsBloc>()
                          //     .add(DobToEnableLocationEvent());
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
