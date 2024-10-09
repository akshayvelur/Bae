import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card-data_widget.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/home_widget/card_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class CardImageOne extends StatelessWidget {
  const CardImageOne(
      {super.key,
      required this.image,
      required this.name,
      required this.profile,
      required this.mainindex,
      required this.numberOfUser,
      required this.controller,
      required this.dob,required this.currentuserUid,required this. user});

  final dynamic image;
  final String name;
  final dynamic profile;
  final int mainindex;
  final int numberOfUser;
  final CardSwiperController controller;
  final String dob;
  final String currentuserUid;
  final Map user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 606,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // image: DecorationImage(
          //   image: NetworkImage(
          //     image[0],
          //   ),
          //   fit: BoxFit.cover,
          // )
          ),
      child: Stack(children: [     ClipRRect(borderRadius: BorderRadius.circular(10),
        child: Image.network(
              image[0],fit: BoxFit.cover,width: double.infinity,height: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
              },
            ),
      ),CardStatus(
          name: name,
          profile: profile,
          mainindex: mainindex,
          numberOfUser: numberOfUser,
          controller: controller,
          dob: dob,currentuserUid: currentuserUid,user: user,
        ),],
      )
      
      // add profile details using child
    );
  }
}

class CardImageTwo extends StatelessWidget {
  const CardImageTwo({
    super.key,
    required this.image,
    required this.profile,
    required this.mainindex,
    required this.numberOfUser,
    required this.controller,required this.currentuserUid,required this.user
  });

  final dynamic image;
  final dynamic profile;
  final int mainindex;
  final int numberOfUser;
  final CardSwiperController controller;
  final String currentuserUid;
  final Map user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 606,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // image: DecorationImage(
          //     image: NetworkImage(image[1]), fit: BoxFit.cover)
          ),
      child: Stack(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image[1],
                fit: BoxFit.cover, // Ensures the image covers the entire container
          width: double.infinity,
          height: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
              },
            ),
          ),
          CardUserData(
              profile: profile,
              mainindex: mainindex,
              numberOfUser: numberOfUser,
              controller: controller,user: user,),
        ],
      ),
      // add profile details using child
    );
  }
}
