import 'dart:developer';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationPage extends StatefulWidget {
  NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  AppFonts appFonts = AppFonts();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = "";
  UserData userData = UserData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = _auth.currentUser!.uid;
  }

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
        child: FutureBuilder(
            future: userData.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text("No data found"),
                );
              }

              List<Map<String, dynamic>> dataList = snapshot.data!;
              //print(dataList);
              var user = dataList.firstWhere((element) => element['uid'] == uid,
                  orElse: () => {});

              var requester = user['request'];
        String requesterUid = requester.keys.first;
                     log(requesterUid.toString());
              var requestedUser=dataList.firstWhere((element) => element['uid']==requesterUid,orElse: ()=>{});
                log(requestedUser.length.toString());
               var image = requestedUser['image'];
               var username = requestedUser['name'];
               var status=requester[requesterUid];
              log(requestedUser.toString());
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: mediaqueryHight(.007, context),
                  );
                },
                itemCount: requester.length,
                itemBuilder: (context, index) {
                  
                  return Container(
                      height: 65,
                      decoration: BoxDecoration(
                          color: listbckclr,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: 
                                  Image.network(
                                    image[0],
                                    fit: BoxFit.fill,width: double.infinity,height: double.infinity,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      }
                                    },
                                  )
                                  ),
                              radius: 30,
                            ),
                            title: Text(
                             username,
                              style: appFonts.flextext(blackclr,
                                  Fweight: 400, size: 14),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                height: mediaqueryHight(.037, context),
                                width: mediaqueryWidth(.23, context),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 100, 250),
                                    borderRadius: BorderRadius.circular(10)),child: Center(child: Text(status.toString(),style: appFonts.flextext(whiteclr,Fweight: 400,size: 13),),),
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              );
            }),
      ),
    );
  }
}
