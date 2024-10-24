import 'dart:developer';

import 'package:bea_dating/core/data/data_source/last_seen_calculation.dart';
import 'package:bea_dating/core/data/data_source/userdata.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/bloc/chat_bloc.dart';
import 'package:bea_dating/core/presentation/screen/notification_page/notification_page.dart';
import 'package:bea_dating/core/presentation/utilit/color.dart';
import 'package:bea_dating/core/presentation/utilit/fonts.dart';
import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class IndividualChatPage extends StatefulWidget {
  IndividualChatPage({
    super.key,
    required this.users,
    this.chatRoomUid,
  });
  final Map<String, dynamic> users;
  final String? chatRoomUid;

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  AppFonts appFonts = AppFonts();

  UserData userData = UserData();

  FirebaseAuth _auth = FirebaseAuth.instance;
 String lastSeen="";
  TextEditingController textController = TextEditingController();

  Stream<QuerySnapshot<Map<String, dynamic>>> usertream =
      FirebaseFirestore.instance.collection("users").snapshots();

        ScrollController _scrollController = ScrollController();
  @override
  void initState() {
   lastSeen =lastSeenCalculation(widget.users['lastSeen']);
    // TODO: implement initState
    super.initState();
  
       WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }
  void _scrollToBottom() {
    // Delay the scrolling to make sure the layout is fully rendered
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteclr,
        //  centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          titleSpacing: 0,
          title: InkWell(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: widget.users['image'][0],
                      fit: BoxFit.cover,
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
                      widget.users['name'],
                      style:
                          appFonts.flextext(blackclr, Fweight: 400, size: 18),
                    ),
                    
                    Text(
                      widget.users['status']=="online"?"Online":lastSeen,
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
                image: DecorationImage(
                    image: AssetImage("assets/chatbackground.JPEG"),fit: BoxFit.cover)
                ),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                      stream: userData.getAllChat(widget.chatRoomUid.toString()),
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

                        return mynotify.isNotEmpty
                            ? ListView.builder(
                              controller: _scrollController,
                                 itemCount: mynotify.length,
                                itemBuilder: (context, index) {
                                  final data = mynotify[index];
                                  final String msg = data['msg'];
                                  final bool isSender =
                                      _auth.currentUser!.uid ==
                                          data['senderId'];
                                   final timestamp=data['timestamp'].toDate();      
                                    String time=DateFormat('hh:mm a').format(timestamp); 
                                  return Align(
                                      alignment: isSender
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                        child: ConstrainedBox(constraints: BoxConstraints(maxWidth:250),
                                          child: Container(
                                              decoration: isSender? BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(15),
                                                      topLeft: Radius.circular(15),
                                                      topRight:
                                                          Radius.circular(15)),
                                                  color:chatIconClr): BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(15),
                                                      topLeft: Radius.circular(15),
                                                      topRight:
                                                          Radius.circular(15)),
                                                  color: blackshadow),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 13,right: 13,top: 13,bottom: 6),
                                                child: Column(crossAxisAlignment:isSender ?CrossAxisAlignment.end:CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(msg,style:isSender? appFonts.flextext(blackclr,Fweight: 400,size: 14):appFonts.flextext(whiteclr,Fweight: 400,size: 14),),
                                                   SizedBox(height: 5,),
                                                    Text(time,style:isSender? appFonts.flextext(blackshadow,Fweight: 400,size: 10):appFonts.flextext(const Color.fromARGB(170, 255, 255, 255),Fweight: 400,size: 10),)],
                                                ),
                                              )),
                                        ),
                                      ));
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
                _chatInput(context, widget.users['uid'])
              ],
            ),
          ),
        ));
  }

  Widget _chatInput(BuildContext context, String userUid) {
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
            if(textController.text.isNotEmpty){
            context.read<ChatBloc>().add(TesxtMessagesentEvent(
                text: textController.text, receiverId: userUid));
            textController.clear();}
          },
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
