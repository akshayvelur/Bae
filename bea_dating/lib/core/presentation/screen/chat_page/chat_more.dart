import 'package:bea_dating/core/data/data_uploading/report_upload.dart';
import 'package:bea_dating/core/data/service/block_service.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/view_account.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMorePage extends StatelessWidget {
  ChatMorePage({super.key, required this.user});
  final Map<String, dynamic> user;
  AppFonts appFonts = AppFonts();
  Reporting reporting=Reporting();
  Block block=Block();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "Info",
          style: appFonts.appBarfont,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mediaqueryHight(.1, context),
          ),
          Center(
              child: Container(
            height: mediaqueryHight(.45, context),
            width: mediaqueryWidth(.9, context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(204, 223, 223, 223)),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: mediaqueryHight(.05, context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(FadeTransitionPageRoute(
                          child: ViewAccount(uid: user['uid'])));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: user['image'][0],
                          fit: BoxFit.cover,
                          width: 130,
                          height: 130,
                        )),
                  ),
                  SizedBox(
                    height: mediaqueryHight(.02, context),
                  ),
                  Text(
                    user['name'],
                    style: appFonts.flextext(blackclr, size: 17, Fweight: 500),
                  ),
                  SizedBox(
                    height: mediaqueryHight(.05, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: mediaqueryHight(.05, context),
                            width: mediaqueryWidth(.4, context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            child: TextButton(
                                onPressed: () {
                                  block.blockService(user['uid']);
                                },
                                child: Text(
                                  "Block",
                                  style: appFonts.flextext(blackclr,
                                      Fweight: 400, size: 15),
                                ))),
                        SizedBox(
                          width: mediaqueryWidth(.03, context),
                        ),
                        Container(
                            height: mediaqueryHight(.05, context),
                            width: mediaqueryWidth(.4, context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            child: TextButton(
                                onPressed: () {
                                  reporting.reportUploading(user['uid']);
                                },
                                child: Text(
                                  "Report",
                                  style: appFonts.flextext(blackclr,
                                      Fweight: 400, size: 15),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
