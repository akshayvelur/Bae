import 'package:bea_dating/core/presentation/screen/category/bloc/category_bloc.dart';
import 'package:bea_dating/core/presentation/screen/category/boostpage.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/category_Widget/cat_Topscroll_widget.dart';
import 'package:bea_dating/core/presentation/widgets/category_Widget/cursh_time_card_widget.dart';
import 'package:bea_dating/core/presentation/widgets/category_Widget/preference_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  AppFonts appFonts = AppFonts();

  Map<String, String> cat = {
    "NewMatch": "assets/photo-1522075469751-3a6694fb2f61.jpg",
    "Online": "assets/woman-2nd.jpg",
    "Active": "assets/woman.jpg",
    "Recent": "assets/man n.jpg"
  };
  Map<String, String> exploreimg = {
    "Coffee Date": "assets/dinner-7736494_1280.jpg",
    "Looking for love": "assets/looking for love.jpg",
    "Hiking and Backpacking": "assets/hiking.jpg",
    "Lets be Friends": "assets/lest be friends.jpg",
    "Creatives": "assets/Asthetic.jpg",
    "Ride": "assets/Riders.jpg",
    "Foodies": "assets/Burgers.jpg",
    "Sporty": "assets/sporty.jpg",
  };
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
                    TopScrollWidget(cat: cat, appFonts: appFonts),
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
                    PreferenceCardWidget(exploreimg: exploreimg, appFonts: appFonts),
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
