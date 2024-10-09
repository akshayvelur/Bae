

import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class TabControllers extends StatelessWidget {
  const TabControllers({
    super.key,
    required this.image,
    required this.name,
    required this.profile,
    required this.mainindex,
    required this.numberOfUser,
    required this.controller,required this.dob,required this.currentuserUid,required this.user
  });

  final dynamic image;
  final String name;
  final dynamic profile;
  final int mainindex;
  final int numberOfUser;
  final CardSwiperController controller;
  final currentuserUid;
final String dob;
final Map user;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: TabBar(
                  tabs: [Container(), Container()],
                ),
              ),
              Flexible(
                flex: 3,
                child: TabBarView(
                    physics: PageScrollPhysics(),
                    children: [
                      CardImageOne(
                          image: image,
                          name: name,
                          profile: profile,
                          mainindex: mainindex,
                          numberOfUser:
                              numberOfUser,
                          controller: controller,dob: dob,currentuserUid: currentuserUid,user: user,),
                      // tab2
                      CardImageTwo(
                          image: image,
                          profile: profile,
                          mainindex: mainindex,
                          numberOfUser:
                              numberOfUser,currentuserUid:currentuserUid,
                          controller: controller,user: user,),
                    ]),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ));
  }
}
