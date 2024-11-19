import 'package:bea_dating/core/presentation/screen/category/bloc/category_bloc.dart';
import 'package:bea_dating/core/presentation/screen/category/boost/boostpage.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/utilit/variable_collection.dart';
import 'package:bea_dating/core/presentation/widgets/category_Widget/cat_Topscroll_widget.dart';
import 'package:bea_dating/core/presentation/widgets/category_Widget/cursh_time_card_widget.dart';
import 'package:bea_dating/core/presentation/widgets/category_Widget/preference_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  AppFonts appFonts = AppFonts();

CatVariable catVariable=CatVariable();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if(state is NavigateToBoostState){
          Navigator.of(context).push(FadeTransitionPageRoute(child:BoostPage() ));
        }
     
      },
      builder: (context, state) {
        return Scaffold(backgroundColor: whiteclr,
          appBar: AppBar(backgroundColor: whiteclr,
            automaticallyImplyLeading: false,
            title: Text(
              "Bae",
              style: subLogoblack,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopScrollWidget(cat: catVariable.cat, appFonts: appFonts),
                    Text(
                      "Welcome to Explore",
                      style: appFonts.flexhead(blackclr, size: 18),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.01, context),
                    ),
                    CrushTimeCardWidget(appFonts: appFonts),
                    SizedBox(
                      height: mediaqueryHight(.015, context),
                    ),
                    //Explore widgets
                    PreferenceCardWidget(exploreimg: catVariable.exploreimg, appFonts: appFonts),
                    SizedBox(
                      height: mediaqueryHight(.10, context),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
