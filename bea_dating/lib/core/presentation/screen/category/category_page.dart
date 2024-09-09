import 'package:bea_dating/core/presentation/screen/category/bloc/category_bloc.dart';
import 'package:bea_dating/core/presentation/screen/category/boostpage.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zo_animated_border/zo_animated_border.dart';

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
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
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
                    Container(
                      height: mediaqueryHight(.16, context),
                      width: mediaqueryWidth(100, context),
                      // color: blackshadow,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 1, right: 16, top: 5),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: mediaqueryHight(.12, context),
                                    width: mediaqueryWidth(.20, context),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: blackshadow,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              cat.values.elementAt(index),
                                            ),
                                            fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                              color: blackclr, blurRadius: 2)
                                        ]),
                                  ),
                                  SizedBox(
                                    height: mediaqueryHight(.001, context),
                                  ),
                                  Text(
                                    cat.keys.elementAt(index),
                                    style:
                                        appFonts.flextext(blackclr, size: 13),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Welcome to Explore",
                      style: appFonts.flexhead(blackclr, size: 18),
                    ),
                    SizedBox(
                      height: mediaqueryHight(.01, context),
                    ),
                    Container(
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
                    ),
                    SizedBox(
                      height: mediaqueryHight(.015, context),
                    ),
                    //Explore widgets
                    Container(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 210,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(blurRadius: 2, color: blackclr)
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                      exploreimg.values.elementAt(index),
                                    ),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 130),
                              child: Container(
                                  width: mediaqueryWidth(.36, context),
                                  child: Text(
                                    exploreimg.keys.elementAt(index),
                                    style:
                                        appFonts.flextext(whiteclr, size: 20),
                                  )),
                            )),
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ),
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
