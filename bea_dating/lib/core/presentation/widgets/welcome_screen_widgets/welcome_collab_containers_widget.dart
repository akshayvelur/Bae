import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class WelcomeColabergWidget extends StatelessWidget {
  const WelcomeColabergWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Container(
                height: mediaqueryHight(.17, context),
                width: mediaqueryWidth(.24, context),
                decoration: const BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 56, 55, 55),
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ],
                     ),
                     child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image(image:AssetImage("assets/mwc21-online-dating-apps-featured-1500x986.jpg",),fit: BoxFit.cover,))
              ),
            ),
            WelcomeCollab(context, "assets/pixel.MPEJ.jpg"), 
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10),
              child: Container(
                height: mediaqueryHight(.1, context),
                width: mediaqueryWidth(.24, context),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 56, 55, 55),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 2,
                        offset: Offset(0, 1),
                        blurRadius: 2)
                  ],
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/Drink.MPEG.jpg",fit: BoxFit.fill,),),
              ),
            ),
            WelcomeCollab(context, "assets/Girl.MPEG.jpg"),
            WelcomeCollab(context, "assets/Beach.MPEG.jpg")
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: mediaqueryHight(.05, context),
                width: mediaqueryWidth(.24, context),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage("assets/hands.MPEG - Copy.jpg"),
                      fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 56, 55, 55),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 2,
                        offset: Offset(0, 1),
                        blurRadius: 2)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Container(
                height: mediaqueryHight(.17, context),
                width: mediaqueryWidth(.24, context),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/love.MPEG.png"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Container(
                height: mediaqueryHight(.17, context),
                width: mediaqueryWidth(.24, context),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage("assets/wild.MPEG.jpg"),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 56, 55, 55),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 2,
                        offset: Offset(0, 1),
                        blurRadius: 2)
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: mediaqueryHight(.16, context),
                width: mediaqueryWidth(.175, context),
                decoration: const BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 56, 55, 55),
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ],
                    image: DecorationImage(
                        image: AssetImage("assets/Ride.MPEG.jpg"),
                        fit: BoxFit.fitWidth)),
              ),
            ),
            Container(
              height: mediaqueryHight(.17, context),
              width: mediaqueryWidth(.175, context),
              decoration: const BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 56, 55, 55),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 2,
                        offset: Offset(0, 1),
                        blurRadius: 2)
                  ],
                  image: DecorationImage(
                      image:
                          AssetImage("assets/myBeach.MPEG - Copy.jpg"),
                      fit: BoxFit.fill)),
            ),
          ],
        ),
      ],
    );
  }
}

Padding WelcomeCollab(BuildContext context, String images) {
  return Padding(
    padding: const EdgeInsets.only(
   left: 10,
      bottom: 10,
    ),
    child: Container(
      height: mediaqueryHight(.17, context),
      width: mediaqueryWidth(.24, context),
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(10)),
           boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 56, 55, 55),
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 2,
                            offset: Offset(0, 1),
                            blurRadius: 2)
                      ]
          ),
   child:ClipRRect(borderRadius: BorderRadius.circular(10),child: Image(image: AssetImage(images),fit: BoxFit.fill,)), ),
  );
}
