
import 'package:bea_dating/core/presentation/screen/category/bloc/category_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zo_animated_border/zo_animated_border.dart';

class CrushTimeCardWidget extends StatelessWidget {
  const CrushTimeCardWidget({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHight(.22, context),
      width: mediaqueryWidth(100, context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blackshadow,
          boxShadow: [
            BoxShadow(blurRadius: 2, color: blackclr),
          ],
          image: DecorationImage(
              image: AssetImage("assets/people123.jpg"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(107, 153, 148, 148)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cursh Time",
                    style: appFonts.flextext(blackclr,
                        size: 22, Fweight: 700)),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Text(
                  "You don’t have enough like to play.Boost your profile for better visvisibility",
                  style: appFonts.flextext(blackclr, size: 16),
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 200, top: 10),
                  child: ZoAnimatedGradientBorder(
                    height: mediaqueryHight(.04, context),
                    width: mediaqueryWidth(.30, context),
                    gradientColor: [
                      Color.fromARGB(255, 109, 228, 105),
                      whiteclr,
                      whiteclr,
                      Color.fromARGB(255, 88, 234, 219)
                    ],
                    child: InkWell(
                      onTap: () {
                        context
                            .read<CategoryBloc>()
                            .add(BootEvent());
                      },
                      child: Container(
                        height: mediaqueryHight(.04, context),
                        width: mediaqueryWidth(.30, context),
                        decoration: BoxDecoration(
                            color: blackclr,
                            borderRadius:
                                BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 8,
                                    top: 8,
                                    bottom: 8),
                                child: Image.asset(
                                  "assets/icons8-flash-48.png",
                                  fit: BoxFit.contain,
                                  scale: 2,
                                ),
                              ),
                              Text(
                                "Boost",
                                style: appFonts.flextext(
                                    whiteclr,
                                    size: 20,
                                    Fweight: 500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
