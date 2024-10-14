import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewFollowWidget extends StatelessWidget {
  ViewFollowWidget(
      {super.key,
      required this.appFonts,
      required this.count,
      required this.headline});

  final AppFonts appFonts;
  String headline;
  int count;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteclr,
            boxShadow: [BoxShadow(blurRadius: 2,blurStyle: BlurStyle.inner)]),
        height: mediaqueryHight(.07, context),
        width: mediaqueryWidth(.2, context),
        child: Column(
          children: [
            Text(
              count.toString(),
              style: appFonts.userNamefont,
            ),
            Text(
              headline,
              style: appFonts.matchfont,
            )
          ],
        ));
  }
}


class ViewUserNameAgeBasic extends StatefulWidget {
   ViewUserNameAgeBasic({
    super.key,
    required this.appFonts,required this.user
   
  });

  final AppFonts appFonts;
    UserModel user;
  @override
  State<ViewUserNameAgeBasic> createState() => _UserBasicdataState();
}

class _UserBasicdataState extends State<ViewUserNameAgeBasic> {
  int currentyear =DateTime.now().year;
  int age=0;
  
  void initState() {
    List<String>uyear =widget.user.dob.split("/");
  age=currentyear-int.parse(uyear.last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: whiteclr,
      width: mediaqueryWidth(100, context),
      height: mediaqueryHight(.12, context),
      child: Row(
        children: [
          Container(
            //color: blackclr,
            width: mediaqueryWidth(.45, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.user.name} , ${age}",
                  style: widget.appFonts.userNamefont,
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
              if(widget.user.profile['about']!=null)  Text(
                  widget.user.profile['about'],
                  style: widget.appFonts.userStatus,
                )
              ],
            ),
          ),
          Column(
            children: [
             //  MatchAndFollow(appFonts: widget.appFonts),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 36),
                //child:
              )
            ],
          )
        ],
      ),
    );
  }
}
