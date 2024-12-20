import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:lottie/lottie.dart';

class CardUserData extends StatelessWidget {
  const CardUserData(
      {super.key,
      required this.profile,
      required this.mainindex,
      required this.numberOfUser,
      required this.controller,
      required this.user});

  final dynamic profile;
  final int mainindex;
  final int numberOfUser;
  final CardSwiperController controller;
  final Map user;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              if (profile != null && profile.containsKey("relationship"))
                myContainer(
                  title: "Relationship : ${profile['relationship']}",
                ),
              SizedBox(
                width: mediaqueryWidth(.04, context),
              ),
              if (profile['drink'] != null && profile.containsKey("drink"))
                myContainer(
                  title: "Drink : ${profile['drink']}",
                )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              if (profile != null && profile.containsKey("interest"))
                myContainer(
                  title: "Interest : ${profile['interest type']}",
                ),
              SizedBox(
                width: mediaqueryWidth(.06, context),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (profile != null && profile.containsKey("smoke"))
                myContainer(
                  title: "smoke : ${profile['smoke']}",
                ),
              SizedBox(
                width: mediaqueryWidth(.06, context),
              ),
              if (profile != null && profile.containsKey("interest type"))
                myContainer(
                  title: "interest type : ${profile['interest type']}",
                )
              // myContainer(title: "yttt",)
            ],
          ),
        ),
        SizedBox(
          height: mediaqueryHight(.01, context),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  backgroundColor: shadowclr,
                  onPressed: () {
                    if (mainindex < numberOfUser) {
                      print(numberOfUser);
                      context
                          .read<HomeblocBloc>()
                          .add(CountEvent(count: mainindex));
                    }

                    controller.swipe(CardSwiperDirection.left);
                  },
                  child: Image.asset(
                    'assets/icons8-cancel-100.png',
                    scale: 2.5,
                    fit: BoxFit.cover,
                  )),
              FloatingActionButton(
                backgroundColor: shadowclr,
                onPressed: () {
                  // controller.swipe(CardSwiperDirection.top);
                },
                child: Image.asset(
                  'assets/icons8-lightning-100.png',
                  scale: 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              FloatingActionButton(
                backgroundColor: shadowclr,
                onPressed: () async {
                  if (mainindex <= numberOfUser) {
                    context
                        .read<HomeblocBloc>()
                        .add(UserLikeEvent(likeduser: user['uid']));
                  }
                  if (mainindex < numberOfUser) {
                    context
                        .read<HomeblocBloc>()
                        .add(CountEvent(count: mainindex));
                  }
                  controller.swipe(CardSwiperDirection.right);
                  showLotte(context);
                  await Future.delayed(Duration(seconds: 1));

                  if (mainindex < numberOfUser) {
                    Navigator.pop(context);
                  }
                  if (mainindex == numberOfUser) {
                    Navigator.pop(context);
                  }
                },
                child: Image.asset('assets/icons8-love-96.png',
                    scale: 2.5, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
showLotte(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
          child: LottieBuilder.asset("assets/Animation - 1732255942175.json"));
    },
  );
}
