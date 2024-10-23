import 'dart:developer';
import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/bloc/chat_bloc.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/individual_chat.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  AppFonts appFonts = AppFonts();
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserData userData = UserData();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is NavigateToIndividualState) {
          // Navigator.of(context)
          //     .push(FadeTransitionPageRoute(child: IndividualChatPage(users:state.user)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whiteclr,
          appBar: AppBar(
            backgroundColor: whiteclr,
            shadowColor: whiteclr,
            title: Text(
              "chat",
              style: appFonts.appBarfont,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Matches",
                    style: appFonts.subHeadline,
                  ),
                  SizedBox(
                    height: mediaqueryHight(.01, context),
                  ),
                  StreamBuilder(
                    stream: userData.getAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error${snapshot.error}"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Map<String, dynamic>> allUser = snapshot.data!.docs
                          .map(
                            (doc) => doc.data() as Map<String, dynamic>,
                          )
                          .toList();
                      Map<String, dynamic> filterduse = allUser.firstWhere(
                          (element) => element["uid"] == _auth.currentUser!.uid,
                          orElse: () => {});
                      List<dynamic> matchList = filterduse['match'];
                      //  log(matchList.toString());

                      return Container(
                        // color: Color.fromRGBO(151, 151, 150, 0.749),
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: matchList.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> myuser = allUser.firstWhere(
                              (element) => element['uid'] == matchList[index],
                              orElse: () => {},
                            );
                            String name = myuser["name"];
                            String uid = myuser["uid"];
                            List<dynamic> image = myuser["image"];
                            //  log(name.toString());
                            List<String>ids=[_auth.currentUser!.uid,uid];
                            ids.sort();
                            String mchatUid=ids.join('_');
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      FadeTransitionPageRoute(
                                          child: IndividualChatPage(
                                              users: myuser,chatRoomUid: mchatUid,)));
                                },
                                splashColor: blackshadow,
                                borderRadius: BorderRadius.circular(10),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 2,
                                                  offset: Offset(0, 0))
                                            ]),
                                        child: CircleAvatar(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: CachedNetworkImage(
                                              imageUrl: image[0],
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(
                                                color: clrGreen,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                          radius: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        height: mediaqueryHight(.005, context),
                                      ),
                                      Container(
                                        height: 15,
                                        width: 50,
                                        child: Center(
                                            child: Text(
                                          name,
                                          style: appFonts.flextext(blackclr,
                                              Fweight: 400, size: 14),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: mediaqueryHight(.01, context),
                  ),
                  Text(
                    "Messages",
                    style: appFonts.subHeadline,
                  ),
                  SizedBox(
                    height: mediaqueryHight(.01, context),
                  ),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: userData.getAllUsers(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("error${snapshot.error}"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: clrGreen,
                          ),
                        );
                      }
                      List<Map<String, dynamic>> users = snapshot.data!.docs
                          .map(
                            (doc) => doc.data() as Map<String, dynamic>,
                          )
                          .toList();
                      var myuser = users.firstWhere(
                        (element) => element["uid"] == _auth.currentUser!.uid,
                      );
                      List chatList = myuser["chatUsers"];
                      //log(chatList.length.toString());
                      return  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: userData.getAllMessage(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("error${snapshot.error}"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: clrGreen,
                          ),
                        );
                      }
                      List<Map<String, dynamic>> chatroom = snapshot.data!.docs
                          .map(
                            (doc) => doc.data() as Map<String, dynamic>,
                          )
                          .toList();
                          List<Map<String, dynamic>>userchat= chatroom.where((element) => element.values.contains(_auth.currentUser!.uid),).toList();
                      // var myuser = users.firstWhere(
                      //   (element) => element["uid"],
                      // );
                      // List chatList = myuser["chatUsers"];
                     
                       return Container(
                        height: 495,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Color.fromARGB(78, 136, 156, 155),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: chatList.isNotEmpty? ListView.separated(
                              itemCount: chatList.length,
                              itemBuilder: (context, index) {
                             var chatid=userchat[index]["receiverId"];
                             var chatRoomId=userchat[index]["chatuid"];
                             if(chatid==_auth.currentUser!.uid){
                              chatid=userchat[index]["senderId"];
                             }
                              DateTime timestamp=  userchat[index]['timestamp'].toDate();
                              String formattedTime = DateFormat('hh:mm a').format(timestamp);
                             Map<String,dynamic> people=users.firstWhere((element) =>element["uid"]==chatid,);
                             var image=people['image'];
                             String name=people['name'];
                         //   String chatRoomId=people["chatUsers"][index];
                             
                             log(people["name"].toString());
                             
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, right: 5, top: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                      FadeTransitionPageRoute(
                                          child: IndividualChatPage(
                                              users: people,chatRoomUid: chatRoomId,)));
             
                                     //context.read<ChatBloc>().add(IndividualEvent(user: chatUserList));
                                      //Individual chat Inkwell
                                    },
                                    splashColor: blackshadow,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Ink(
                                      child: Container(
                                          height: mediaqueryHight(.07 , context),
                                          decoration: BoxDecoration(
                                              color: listTileclr,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                              child: ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 26,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: CachedNetworkImage(
                                                        imageUrl: image[0],
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(
                                                          color: clrGreen,
                                                        ),
                                                      ),
                                                    ),
                                                    backgroundColor: usercircle,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 10,right: 10),
                                                  title: Text(
                                                    name,
                                                    style: appFonts.flextext(
                                                        blackclr,
                                                        Fweight: 400,
                                                        size: 15.5),
                                                  ),trailing: Text(formattedTime),))),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70, right: 10),
                                  child: Container(
                                    height: mediaqueryHight(.0002, context),
                                    color: blackshadow,
                                  ),
                                );
                              }):Center(child: Text("No chat found"),),
                        ),
                      );
                    },
                  );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// Container(
//                         height: 495,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           //color: Color.fromARGB(78, 136, 156, 155),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: chatList.isNotEmpty? ListView.separated(
//                               itemCount: chatList.length,
//                               itemBuilder: (context, index) {
//                                 Map<String,dynamic> chatUserList = users.firstWhere((element) => element['uid']==chatList[index],);
//                                 var image = chatUserList["image"];
//                                 String name = chatUserList['name'];
//                                 return Padding(
//                                   padding: const EdgeInsets.only(
//                                       bottom: 8, right: 5, top: 5),
//                                   child: InkWell(
//                                     onTap: () {
//                                         Navigator.of(context) .push(FadeTransitionPageRoute(child: IndividualChatPage(users:chatUserList)));
             
//                                      //context.read<ChatBloc>().add(IndividualEvent(user: chatUserList));
//                                       //Individual chat Inkwell
//                                     },
//                                     splashColor: blackshadow,
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Ink(
//                                       child: Container(
//                                           height: mediaqueryHight(.07 , context),
//                                           decoration: BoxDecoration(
//                                               color: listTileclr,
//                                               borderRadius:
//                                                   BorderRadius.circular(15)),
//                                           child: Center(
//                                               child: ListTile(
//                                                   leading: CircleAvatar(
//                                                     radius: 26,
//                                                     child: ClipRRect(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               50),
//                                                       child: CachedNetworkImage(
//                                                         imageUrl: image[0],
//                                                         width: double.infinity,
//                                                         height: double.infinity,
//                                                         fit: BoxFit.cover,
//                                                         errorWidget: (context,
//                                                                 url, error) =>
//                                                             Icon(Icons.error),
//                                                         placeholder: (context,
//                                                                 url) =>
//                                                             CircularProgressIndicator(
//                                                           color: clrGreen,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     backgroundColor: usercircle,
//                                                   ),
//                                                   contentPadding:
//                                                       EdgeInsets.only(left: 10,right: 10),
//                                                   title: Text(
//                                                     name,
//                                                     style: appFonts.flextext(
//                                                         blackclr,
//                                                         Fweight: 400,
//                                                         size: 15.5),
//                                                   ),trailing: Text("12:30"),))),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 70, right: 10),
//                                   child: Container(
//                                     height: mediaqueryHight(.0002, context),
//                                     color: blackshadow,
//                                   ),
//                                 );
//                               }):Center(child: Text("No chat found"),),
//                         ),
//                       );