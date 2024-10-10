import 'dart:developer';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/notification_page/bloc/notification_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
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
                  var user = dataList.firstWhere(
                      (element) => element['uid'] == uid,
                      orElse: () => {});
                  List<dynamic> requester = user['request'];
                  dataList.firstWhere(
                      (element) => requester.contains(element['uid']),
                      orElse: () => {});
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: mediaqueryHight(.007, context),
                      );
                    },
                    itemCount: requester.length,
                    itemBuilder: (context, index) {
                      final requser = dataList[index];
                      final image = requser['image'];
                      final username = requser['name'];
                      final requesterid = requser['uid'];
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
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        image[0],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
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
                                      )),
                                  radius: 25,
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
                                        color: const Color.fromARGB(
                                            255, 0, 100, 250),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                        // request button
                                        onTap: () {
                                          context.read<NotificationBloc>().add(
                                              RequestAcceptEvent(
                                                  Requester: requesterid));
                                        },
                                        splashColor: blackclr,
                                        borderRadius: BorderRadius.circular(7),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: whiteclr),
                                          child: Center(
                                            child: Text(
                                              "Request",
                                              style: appFonts.flextext(whiteclr,
                                                  Fweight: 400, size: 13),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  );
                }),
          );
        },
      ),
    );
  }
}
