import 'dart:developer';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/home_screen/view_account/view_account.dart';
import 'package:bea_dating/core/presentation/screen/notification_page/bloc/notification_bloc.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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

  Stream<QuerySnapshot<Map<String, dynamic>>> usertream =
      FirebaseFirestore.instance.collection("users").snapshots();

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
        buildWhen: (previous, current) => current is NotificationState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(15),
              child: StreamBuilder(
                stream: usertream,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<Map<String, dynamic>> mynotify = snapshot.data!.docs
                      .map(
                        (doc) => doc.data(),
                      )
                      .toList();

                  var myuse = mynotify.firstWhere((user) => user['uid'] == uid);

                  Map<String, dynamic> request = myuse["request"]??{};
                   
                  List<String> requesters = [];
                  List<String> message = [];
                  if(request.isNotEmpty){
                   request.forEach((key, value) {
                    requesters.insert(0,key);
                    message.insert(0,value);
                    // requesters.add(key);
                    // message.add(value);
                    
                  });}
                  log(message.toString());
                  return requesters.isNotEmpty? ListView.separated( separatorBuilder: (context, index) {
                      return SizedBox(
                        height: mediaqueryHight(.007, context),
                      );
                    },
                    itemCount: requesters.length,
                    itemBuilder: (context, index) {
                      var user=mynotify.firstWhere((user) => user["uid"]==requesters[index],);
                      String name =user['name'];
                     
                       return Container(
                          height: 65,
                          decoration: BoxDecoration(
                              color: listbckclr,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: InkWell(onTap: () {
                                Navigator.of(context).push(FadeTransitionPageRoute(child: ViewAccount(uid: user['uid'])));
                              },
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child:ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl:user["image"][0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )),
                                    radius: 25,
                                  ),
                                  title: Text(
                                    user['name'],
                                    style: appFonts.flextext(blackclr,
                                        Fweight: 400, size: 14),
                                  ),
                                  trailing:message[index]=="request"? Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child:Container(
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
                                                    Requester:requesters[index] ));
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
                                               message[index],
                                                style: appFonts.flextext(whiteclr,
                                                    Fweight: 400, size: 13),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ):Padding(
                                    padding: const EdgeInsets.only(right: 20 ),
                                    child: Container(child: Text(message[index],style: appFonts.flextext(blackclr,size: 13,),)),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  ):
                  // give a lottie
                  Center(child: LottieBuilder.asset("assets/Animation - 1728964414856.json"),);
                },
              ));
        },
      ),
    );
  }
}









// safe
// import 'dart:developer';

// import 'package:bea_dating/core/data/data_source/userdata.dart';
// import 'package:bea_dating/core/presentation/screen/notification_page/bloc/notification_bloc.dart';
// import 'package:bea_dating/core/presentation/utilit/color.dart';
// import 'package:bea_dating/core/presentation/utilit/fonts.dart';
// import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // ignore: must_be_immutable
// class NotificationPage extends StatefulWidget {
//   NotificationPage({super.key});

//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   AppFonts appFonts = AppFonts();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   String uid = "";
//   UserData userData = UserData();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     uid = _auth.currentUser!.uid;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Activity",
//           style: appFonts.appBarfont,
//         ),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//       ),
//       body: BlocConsumer<NotificationBloc, NotificationState>(buildWhen: (previous, current) =>current is NotificationState,
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.all(15),
//             child: FutureBuilder(
//                 future: userData.getData(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   }
//                   if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(
//                       child: Text("No data found"),
//                     );
//                   }

//                   List<Map<String, dynamic>> dataList = snapshot.data!;
//                   //print(dataList);
//                   var user = dataList.firstWhere(
//                       (element) => element['uid'] == uid,
//                       orElse: () => {});
//                   List<dynamic> requesterIds = user['request'] ?? [];
//              List<Map<String, dynamic>> requesters = dataList.where((element) => 
//                 element['uid'] != null && requesterIds.contains(element['uid'].toString())
//                ).toList();
//                   return ListView.separated(
//                     separatorBuilder: (context, index) {
//                       return SizedBox(
//                         height: mediaqueryHight(.007, context),
//                       );
//                     },
//                     itemCount: requesters.length,
//                     itemBuilder: (context, index) {
//                       final requser = requesters[index];
//                       final image = requser['image'];
//                       final username = requser['name'];
//                       final requesterid = requser['uid'];
//                       return Container(
//                           height: 65,
//                           decoration: BoxDecoration(
//                               color: listbckclr,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 5),
//                               child: ListTile(
//                                 contentPadding: EdgeInsets.zero,
//                                 leading: CircleAvatar(
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(40),
//                                       child: Image.network(
//                                         image[0],
//                                         fit: BoxFit.cover,
//                                         width: double.infinity,
//                                         height: double.infinity,
//                                         loadingBuilder:
//                                             (context, child, loadingProgress) {
//                                           if (loadingProgress == null) {
//                                             return child;
//                                           } else {
//                                             return Center(
//                                               child: CircularProgressIndicator(
//                                                 value: loadingProgress
//                                                             .expectedTotalBytes !=
//                                                         null
//                                                     ? loadingProgress
//                                                             .cumulativeBytesLoaded /
//                                                         loadingProgress
//                                                             .expectedTotalBytes!
//                                                     : null,
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       )),
//                                   radius: 25,
//                                 ),
//                                 title: Text(
//                                   username,
//                                   style: appFonts.flextext(blackclr,
//                                       Fweight: 400, size: 14),
//                                 ),
//                                 trailing: Padding(
//                                   padding: const EdgeInsets.only(right: 20),
//                                   child: Container(
//                                     height: mediaqueryHight(.037, context),
//                                     width: mediaqueryWidth(.23, context),
//                                     decoration: BoxDecoration(
//                                         color: const Color.fromARGB(
//                                             255, 0, 100, 250),
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: InkWell(
//                                         // request button
//                                         onTap: () {
//                                           context.read<NotificationBloc>().add(
//                                               RequestAcceptEvent(
//                                                   Requester: requesterid));
//                                         },
//                                         splashColor: blackclr,
//                                         borderRadius: BorderRadius.circular(7),
//                                         child: Ink(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               color: whiteclr),
//                                           child: Center(
//                                             child: Text(
//                                               "Request",
//                                               style: appFonts.flextext(whiteclr,
//                                                   Fweight: 400, size: 13),
//                                             ),
//                                           ),
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ));
//                     },
//                   );
//                 }),
//           );
//         },
//       ),
//     );
//   }
// }
