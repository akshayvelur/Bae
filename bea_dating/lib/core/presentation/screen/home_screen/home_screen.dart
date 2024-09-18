import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// ignore: must_be_immutable
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({super.key});
  final CardSwiperController controller = CardSwiperController();
  AppFonts appFonts = AppFonts();
  final cards = [
    'assets/Ride.MPEG.jpg',
    "assets/myBeach.MPEG - Copy.jpg",
    "assets/Drink.MPEG.jpg",
    "assets/Girl.MPEG.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Bae",
          style: subLogoblack,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 1,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>DefaultTabController(length: 2,child:Scaffold(body: Column(
                  children: [Container(child:TabBar(tabs:[Container(),Container()],),),
                    Flexible(flex: 3,
                      child: TabBarView(physics: ClampingScrollPhysics(),children: [
                          Container(
                        height: 606,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                  cards[index],
                                ),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  myContainer(),SizedBox(width: mediaqueryWidth(.06, context),),
                                myContainer()],
                              ),
                              
                            ), Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  children: [
                                    myContainer(),SizedBox(width: mediaqueryWidth(.06, context),),
                                  myContainer()],
                                ),
                            ),
                            SizedBox(height: mediaqueryHight(.01, context),),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: shadowclr,
                                    onPressed: () =>
                                        controller.swipe(CardSwiperDirection.left),
                                    child: Image.asset(
                                      'assets/icons8-cancel-100.png',
                                      scale: 2.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: shadowclr,
                                    onPressed: () =>
                                        controller.swipe(CardSwiperDirection.top),
                                    child: Image.asset(
                                      'assets/icons8-lightning-100.png',
                                      scale: 2.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: shadowclr,
                                    onPressed: () =>
                                        controller.swipe(CardSwiperDirection.right),
                                    child: Image.asset('assets/icons8-love-96.png',
                                        scale: 2.5, fit: BoxFit.cover),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // add profile details using child
                      ),Container(height: 606,color: blackclr,)
                      ] ),
                    ),
                 SizedBox(height: 70,) ],
                ),))
                  
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}


