import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IndividualChatPage extends StatelessWidget {
  IndividualChatPage({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: whiteclr,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: InkWell(onTap: (){

          },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: usercircle,
                ),
                SizedBox(
                  width: mediaqueryWidth(.03, context),
                ),
                Text(
                  "Anna",
                  style: appFonts.appBarfont,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Image.asset(
                  'assets/icons8-video-48.png',
                  scale: 1.8,
                )),
                  Transform.translate(
                    offset: Offset(-12, 0),
                    child: TextButton(
                                    onPressed: () {},
                                    child: Image.asset(
                    'assets/icons8-call-100.png',
                    scale: 4.5,
                                    )),
                  ),
             
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: mediaqueryHight(10, context),
            width: mediaqueryWidth(100, context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/chatbackground.JPEG"))),
          ),
        ));
  }
}
