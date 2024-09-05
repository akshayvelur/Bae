import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

class IndividualChatPage extends StatelessWidget {
  IndividualChatPage({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title:Row(children: [CircleAvatar(radius: 20,backgroundColor:usercircle,),SizedBox(width: mediaqueryWidth(.03, context),),Text("Anna",style: appFonts.appBarfont,)],),
      actions: [IconButton(onPressed: (){}, icon:Icon(Icons.videocam))],),
    );
  }
}
