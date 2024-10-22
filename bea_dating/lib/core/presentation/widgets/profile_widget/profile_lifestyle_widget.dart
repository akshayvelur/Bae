
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/text_widget.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/user_core_cl_Widgets.dart';
import 'package:flutter/material.dart';

class LifeStyleWidget extends StatelessWidget {
  const LifeStyleWidget({
    super.key,
    required this.appFonts,required this.myuser
  });
  final UserModel myuser;
  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: mediaqueryWidth(100, context),
      //height: mediaqueryHight(.33, context),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Лагуна Мудрости _ Couple photoshoot poses, Romantic couples photography, Couple photography poses.jpeg",),fit:BoxFit.cover),
        color: useraboutContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 8,top: 11,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
              text: "Lifestyle habit",
              textfont: appFonts.flexhead(const Color.fromRGBO(255, 193, 7, 1), size: 20),
            ),
            SizedBox(
              height: mediaqueryHight(.02, context),
            ),
          if(myuser.profile['drink']!=null)  UserCoreCollection(
              headline: "How often do you drink?",
              userOut: myuser.profile['drink'],
            ),
            SizedBox(
              height: mediaqueryHight(.01, context),
            ),
            if(myuser.profile['smoke']!=null)   UserCoreCollection(
              headline: "How often do you smoke?",
              userOut: myuser.profile['smoke'],
            ),
            SizedBox(
              height: mediaqueryHight(.01, context),
            ),
          if(myuser.profile['gym']!=null)  UserCoreCollection(
              headline: "Do you workout?",
              userOut: myuser.profile['gym'],
            ),
          ],
        ),
      ),
    );
  }
}
