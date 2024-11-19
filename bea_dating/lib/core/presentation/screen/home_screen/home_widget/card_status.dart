
import 'package:bea_dating/core/data/service/boost_service.dart';
import 'package:bea_dating/core/presentation/screen/category/boost/boostpage.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/bloc/homebloc_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:bea_dating/core/presentation/widgets/container/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CardStatus extends StatefulWidget {
   CardStatus({
    super.key,
    required this.name,
    required this.profile,
    required this.mainindex,
    required this.numberOfUser,
    required this.controller,required this.dob,required this.currentuserUid,required this.user
  });

  final String name;
  final dynamic profile;
  final int mainindex;
  final int numberOfUser;
  final CardSwiperController controller;
 final String dob;
 final String currentuserUid;
 final Map user;
 Boost boost=Boost();
  @override
  State<CardStatus> createState() => _CardStatusState();
}

class _CardStatusState extends State<CardStatus> {
    @override
  int currentyear =DateTime.now().year;
    int age=0;
   
  void initState() {
        super.initState();
   
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
             myContainer(title: widget.name,),SizedBox(width: mediaqueryWidth(.06, context),),
           if(widget.profile['height']!=null&&widget.profile.containsKey("height"))  myContainer(title:"Height : ${widget.profile['height']}",)],
          ),
        ), Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Row(
              // ignore: unnecessary_null_comparison
              children: [  if(age!=null) myContainer(title:"Age : ${currentyear-int.parse(widget.dob.split("/").last)}",),SizedBox(width: mediaqueryWidth(.06, context),),
            if(widget.profile!=null&&widget.profile.containsKey("gym")) myContainer(title:"Gym : ${widget.profile['gym']}"),
            ],
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
                  if(widget.mainindex<widget.numberOfUser){
                    print(widget.numberOfUser);
                       widget.boost.boostReducing(1); 
                  context.read<HomeblocBloc>().add(CountEvent(count:widget.mainindex+1));}
                    widget.controller.swipe(CardSwiperDirection.left);
               }, child: Image.asset(
                  'assets/icons8-cancel-100.png',
                  scale: 2.5,
                  fit: BoxFit.cover,
                )
              ),
              FloatingActionButton(
                backgroundColor: shadowclr,
                onPressed: () {
                 Navigator.of(context).push(FadeTransitionPageRoute(child:  BoostPage()));
                    // controller.swipe(CardSwiperDirection.top);
                    },
                child: Image.asset(
                  'assets/icons8-lightning-100.png',
                  scale: 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              // Like requesting 
              FloatingActionButton(
                backgroundColor: shadowclr,
                onPressed: () {
                     if(widget.mainindex<=widget.numberOfUser){
                     widget.boost.boostReducing(1); 
                     context.read<HomeblocBloc>().add(UserLikeEvent(likeduser: widget.user['uid']));
                  }
                  if(widget.mainindex<widget.numberOfUser){
                 context.read<HomeblocBloc>().add(CountEvent(count:widget.mainindex+1));
              }
               
                    widget.controller.swipe(CardSwiperDirection.right);},
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

