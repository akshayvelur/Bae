import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/widgets/backbutton/back_button.dart';
import 'package:flutter/material.dart';

class UserBasicData extends StatefulWidget {
  const UserBasicData({super.key});

  @override
  State<UserBasicData> createState() => _UserBasicDataState();
}

class _UserBasicDataState extends State<UserBasicData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(height: mediaqueryHight(100, context),width: mediaqueryWidth(100, context),
        decoration: BoxDecoration(gradient: userbasicbclr),
        child: Padding(
          padding: const EdgeInsets.only(left: 12,right: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(height: mediaqueryHight(.05, context),)
              ,InkWell(onTap: () {
                Navigator.pop(context);
              },child: Backbuttons())
            ],
          ),
        ),
      ),
    ));
  }
}

