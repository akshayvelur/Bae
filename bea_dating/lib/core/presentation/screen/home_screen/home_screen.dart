import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

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
                padding: const EdgeInsets.all(10.0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    Container(
                  height: 700,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            cards[index],
                          ),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
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
                  // add profile details using child
                ),
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
