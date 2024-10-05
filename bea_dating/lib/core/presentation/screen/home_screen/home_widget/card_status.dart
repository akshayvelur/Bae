
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CardStatus extends StatelessWidget {
  const CardStatus({
    super.key,
    required this.name,
    required this.profile,
    required this.mainindex,
    required this.numberOfUser,
    required this.controller,
  });

  final String name;
  final dynamic profile;
  final int mainindex;
  final int numberOfUser;
  final CardSwiperController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
             myContainer(title: name,),SizedBox(width: mediaqueryWidth(.06, context),),
           if(profile['height']!=null&&profile.containsKey("height"))  myContainer(title:"Height : ${profile['height']}",)],
          ),
    
        ), Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
            if(profile!=null&&profile.containsKey("gym")) myContainer(title:"Gym : ${profile['gym']}"),SizedBox(width: mediaqueryWidth(.06, context),),
              if(profile['drink']!=null&&profile.containsKey("drink")) myContainer(title:"Drink : ${profile['drink']}",)],
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
                onPressed: () {
                  if(mainindex<numberOfUser){
                    print(numberOfUser);
                  context.read<HomeblocBloc>().add(CountEvent(count:mainindex+1));}
                    controller.swipe(CardSwiperDirection.left);
               }, child: Image.asset(
                  'assets/icons8-cancel-100.png',
                  scale: 2.5,
                  fit: BoxFit.cover,
                )
              ),
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
                onPressed: () {
                  if(mainindex<numberOfUser!){
                  context.read<HomeblocBloc>().add(CountEvent(count:mainindex+1));}
                    controller.swipe(CardSwiperDirection.right);},
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

