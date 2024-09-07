import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  AppFonts appFonts = AppFonts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Activity",
          style: appFonts.appBarfont,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: mediaqueryHight(.007, context),
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(height: 65,
                decoration: BoxDecoration(
                    color: listbckclr,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ListTile(contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: usercircle,
                     radius: 30, ),title: Container(height: 20,width: 10,color: usercircle,),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
