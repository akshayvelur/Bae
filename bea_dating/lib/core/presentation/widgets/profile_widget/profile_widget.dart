import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FollowWidget extends StatelessWidget {
  FollowWidget(
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
        height: mediaqueryHight(.07, context),
        width: mediaqueryHight(.07, context),
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

class MatchAndFollow extends StatelessWidget {
  const MatchAndFollow({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: whiteclr,
      height: mediaqueryHight(.08, context),
      width: mediaqueryWidth(0.47, context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 35,
              top: 5.9,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FollowWidget(
                  appFonts: appFonts,
                  headline: 'match',
                  count: 10,
                ),
                FollowWidget(appFonts: appFonts, count: 80, headline: "Like")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserBasicdata extends StatefulWidget {
  const UserBasicdata({
    super.key,
    required this.appFonts,
  });

  final AppFonts appFonts;

  @override
  State<UserBasicdata> createState() => _UserBasicdataState();
}

class _UserBasicdataState extends State<UserBasicdata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: whiteclr,
      width: mediaqueryWidth(100, context),
      height: mediaqueryHight(.17, context),
      child: Row(
        children: [
          Container(
            //color: whiteclr,
            width: mediaqueryWidth(.45, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Niko ,24",
                  style: widget.appFonts.userNamefont,
                ),
                SizedBox(
                  height: mediaqueryHight(.01, context),
                ),
                Text(
                  "i'm a very serious person ",
                  style: widget.appFonts.userStatus,
                )
              ],
            ),
          ),
          Column(
            children: [
              MatchAndFollow(appFonts: widget.appFonts),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 36),
                child: Container(
                  height: mediaqueryHight(.045, context),
                  width: mediaqueryHight(.13, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: whiteclr,
                    boxShadow: [
                      BoxShadow(
                          color: blackshadow,
                          blurRadius: 2,
                          offset: Offset(2, 0),
                          blurStyle: BlurStyle.normal)
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 10),
                          child: Icon(
                            Icons.electric_bolt_outlined,
                            size: 18,
                          ),
                        ),
                        Text(
                          "Boost",
                          style: widget.appFonts.boostfont,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
