import 'dart:developer';

import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/bloc/chat_bloc.dart';
import 'package:bea_dating/core/presentation/screen/notification_page/notification_page.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class IndividualChatPage extends StatelessWidget {
  IndividualChatPage({super.key, required this.users});

  final Map<String, dynamic> users;
  AppFonts appFonts = AppFonts();
  UserData userData = UserData();
  TextEditingController textController=TextEditingController();
  Stream<QuerySnapshot<Map<String, dynamic>>> usertream =
      FirebaseFirestore.instance.collection("users").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteclr,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: InkWell(
            onTap: () {
              
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipRRect(borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: users['image'][0],fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: clrGreen,
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error_outline),
                    ),
                  ),
                  backgroundColor: usercircle,
                ),
                SizedBox(
                  width: mediaqueryWidth(.03, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      users['name'],
                      style: appFonts.flextext(blackclr,Fweight:400,size: 18 ),
                    ),
                    Text(
                      "Last seen not available",
                      style: appFonts.flextext(blackshadow,
                          Fweight: 400, size: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Image.asset(
                  'assets/icons8-video-48.png',
                  scale: 1.8,
                )),
            Transform.translate(
              offset: Offset(-12, 0),
              child: TextButton(
                  onPressed: () {},
                  child: Image.asset(
                    'assets/icons8-call-100.png',
                    scale: 4.5,
                  )),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("assets/chatbackground.JPEG"),fit: BoxFit.cover)
                ),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                      stream: userData.getAllMessage(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List<Map<String, dynamic>> mynotify =
                            snapshot.data!.docs
                                .map(
                                  (doc) => doc.data(),
                                )
                                .toList();
                        log(mynotify.toString());
                        // var myuse = mynotify.firstWhere((user) => user['uid'] == uid);

                        // Map<String, dynamic> request = myuse["request"]??{};

                        // List<String> requesters = [];
                        // List<String> message = [];
                        // if(request.isNotEmpty){;
                        // request.forEach((key, value) {
                        //   requesters.insert(0,key);
                        //   message.insert(0,value);
                        //   // requesters.add(key);
                        //   // message.add(value);

                        // });
                        // }
                        final List<String> data = [];
                        return data.isNotEmpty
                            ? ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return Text("message:${data[index]}");
                                },
                              )
                            : Center(
                                child: Text(
                                  "Say Haii 👋",
                                  style: appFonts.flextext(blackclr,
                                      Fweight: 400, size: 16),
                                ),
                              );
                      }),
                ),
                _chatInput(context,users['uid'])
              ],
            ),
          ),
        ));
  }

  Widget _chatInput(BuildContext context,String userUid) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions,
                      size: 25,
                      color: chatIconClr,
                    )),
                Expanded(
                    child: TextField(
                    controller: textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Type something....",
                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.image, size: 25, color: chatIconClr)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt, size: 26, color: chatIconClr))
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed: () { 
            context.read<ChatBloc>().add(TesxtMessagesentEvent(text: textController.text,receiverId: userUid));
          textController.clear();},
          minWidth: 0,
          padding: EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 10),
          color: chatSentIconClr,
          shape: CircleBorder(),
          child: Icon(Icons.send),
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
