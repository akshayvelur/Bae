
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/profile_widget/profile_widget.dart';
import 'package:flutter/material.dart';

class MatchAndFollowWidget extends StatelessWidget {
   MatchAndFollowWidget({
    super.key,
    required this.appFonts,required this.user
  });

  final AppFonts appFonts;
   UserModel  user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 35,
            top: 5.9,
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: FollowWidget(
                  appFonts: appFonts,
                  headline: 'match',
                  count: user.match.length,
                ),
              ),
              SizedBox(
                width: mediaqueryWidth(.06, context),
              ),
              GestureDetector(
                  onTap: () {},
                  child: FollowWidget(
                      appFonts: appFonts,
                      count: user.like.length,
                      headline: "Like"))
            ],
          ),
        ),
      ],
    );
  }
}
