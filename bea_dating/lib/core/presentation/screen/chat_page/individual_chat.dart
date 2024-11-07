

///////////
///// 
import 'dart:developer';
import 'dart:io';
import 'package:bea_dating/core/data/constant/call_info.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/calling_page/calling_page.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/chat_more.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/chat_user_profile_image.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/image_view.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/widgets/chat_card_widget.dart';
import 'package:bea_dating/core/presentation/screen/chat_page/widgets/Emoji_widget/emoji_widget.dart';
import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:bea_dating/core/data/data_source_getting/last_seen_calculation.dart';
import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// ignore: must_be_immutable
class IndividualChatPage extends StatefulWidget {
  IndividualChatPage({
    super.key,
    required this.users,
    this.chatRoomUid,required this.currentUserName
  });
  final Map<String, dynamic> users;
  final String? chatRoomUid;
  final String currentUserName;

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  AppFonts appFonts = AppFonts();
  late ImageSource _imageSource;
  String? imagePath;
  UserData userData = UserData();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String lastSeen = "";
  TextEditingController textController = TextEditingController();
  String currentUser="";
  Stream<QuerySnapshot<Map<String, dynamic>>> usertream =
      FirebaseFirestore.instance.collection("users").snapshots();

  ScrollController _scrollController = ScrollController();
  bool isShowEmoji = false;
  @override
  void initState() {
    currentUser=_auth.currentUser!.uid;
    isShowEmoji = false;
    lastSeen = lastSeenCalculation(widget.users['lastSeen']);
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() async{
    // Delay the scrolling to make sure the layout is fully rendered
   await Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is EmojiCoditionState) {
            isShowEmoji = state.isEmoji;
          }
          // TODO: implement listener
        },
        builder: (context, state) {
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
                  onTap: () { 
                    Navigator.of(context).push(FadeTransitionPageRoute(child: ChatMorePage(user: widget.users)));
                  },
                  child: Row(
                    children: [
                      ChatUserProfileImage(widget: widget),
                      SizedBox(
                        width: mediaqueryWidth(.03, context),
                      ),
                      ChatProfileBasicDetails(widget: widget, appFonts: appFonts, lastSeen: lastSeen)
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () async{
                        await ZegoUIKitPrebuiltCallInvitationService().init(
                   appID: CallInfo.appId /*input your AppID*/,
                   appSign: CallInfo.appSign /*input your AppSign*/,
                   userID:currentUser,
                  userName:  widget.currentUserName ,
                  plugins: [ZegoUIKitSignalingPlugin()],
                 );
                 ZegoUIKitPrebuiltCallInvitationService().send(invitees: [ZegoCallUser( widget.users['uid'], widget.currentUserName)], isVideoCall: true);
         
                      },
                      child: Image.asset(
                        'assets/icons8-video-48.png', 
                        scale: 1.8,
                      )),
                  Transform.translate(
                    offset: Offset(-12, 0),
                    child: TextButton(
                        onPressed: () async{
                            await ZegoUIKitPrebuiltCallInvitationService().init(
                   appID: CallInfo.appId /*input your AppID*/,
                   appSign: CallInfo.appSign /*input your AppSign*/,
                   userID:currentUser,
                  userName:  widget.currentUserName ,
                  plugins: [ZegoUIKitSignalingPlugin()],
                 );
                 ZegoUIKitPrebuiltCallInvitationService().send(invitees: [ZegoCallUser( widget.users['uid'], widget.currentUserName)], isVideoCall: false);
                        },
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
                          image: AssetImage("assets/chatbackground.JPEG"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Expanded(
                        child:StreamBuilder(
  stream: userData.getAllChat(widget.chatRoomUid.toString()),
  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    List<Map<String, dynamic>> mynotify = snapshot.data!.docs
        .map((doc) => doc.data())
        .toList();

    if (mynotify.isEmpty) {
      return Center(
        child: Text("Say Haii 👋", style: appFonts.flextext(blackclr, Fweight: 400, size: 16)),
      );
    }

    // Group messages by day
    Map<String, List<Map<String, dynamic>>> groupedMessages = {};
    for (var msg in mynotify) {
      final timestamp = msg['timestamp'].toDate();
      final date = DateFormat('yyyy-MM-dd').format(timestamp); // Group by date

      if (groupedMessages[date] == null) {
        groupedMessages[date] = [];
      }
      groupedMessages[date]!.add(msg);
    }

    // Create a sorted list of dates
    List<String> dates = groupedMessages.keys.toList();
    dates.sort((a, b) => b.compareTo(a)); // Sort by date in descending order

    return ListView.builder(
      controller: _scrollController,
      itemCount: dates.length,
      itemBuilder: (context, dateIndex) {
        final date = dates[ dates.length-1-dateIndex];
        final dateMessages = groupedMessages[date]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  DateFormat('MMMM dd, yyyy').format(DateFormat('yyyy-MM-dd').parse(date)),
                  style: appFonts.flextext(blackshadow, Fweight: 400, size: 14),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dateMessages.length,
              itemBuilder: (context, index) { 
               // final revindex=dateMessages.length-1-index;
                final data = dateMessages[index];
               
                final String msg = data['msg'];
                final String msgType = data["type"];
                final bool isSender = _auth.currentUser!.uid == data['senderId'];
                final timestamp = data['timestamp'].toDate();
                String time = DateFormat('hh:mm a').format(timestamp);

                return ChatCard(isSender: isSender, msgType: msgType, msg: msg, appFonts: appFonts, time: time);
              },
            ),
          ],
        );
      },
    );
  },
)

                      ),
                      _chatInput(context, widget.users['uid']),
                      if (isShowEmoji)
                        EmojiPickerWidget(textController: textController),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget _chatInput(BuildContext context, String receiverUid) {
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
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context
                          .read<ChatBloc>()
                          .add(EmojiCoditionEvent(isEmoji: true));
                    },
                    icon: Icon(
                      Icons.emoji_emotions,
                      size: 25,
                      color: chatIconClr,
                    )),
                Expanded(
                    child: TextField(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<ChatBloc>()
                        .add(EmojiCoditionEvent(isEmoji: false));
                  },
                  controller: textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Type something....",
                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                    // image button
                    onPressed: () {
                      context
                          .read<ChatBloc>()
                          .add(ImagePickEvent(receiverId: receiverUid));
                    },
                    icon: Icon(Icons.image, size: 25, color: chatIconClr)),
                // IconButton(
                //     // camer button
                //     onPressed: () {
                //       _imageSource = ImageSource.camera;
                //      imagePath=_getImage();
                //      if(imagePath!.isNotEmpty){
                //      context.read<ChatBloc>().add(CameraPickEvent(imagePath: imagePath!,receiverId:receiverUid ));
                //      }
                //     },
                //     icon: Icon(Icons.camera_alt, size: 26, color: chatIconClr))
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            if (textController.text.isNotEmpty) {
              context.read<ChatBloc>().add(TesxtMessagesentEvent(
                  text: textController.text, receiverId: receiverUid));
              textController.clear();
            }
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

   // ignore: unused_element
   _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
    return selectedImage.toString();
    }
  }
}

// import 'dart:developer';
// import 'dart:io';
// import 'package:bea_dating/core/data/constant/call_info.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/calling_page/calling_page.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/chat_more.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/chat_user_profile_image.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/image_view.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/widgets/chat_card_widget.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/widgets/Emoji_widget/emoji_widget.dart';
// import 'package:bea_dating/core/presentation/utilit/page_transcation/fade_transition.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:bea_dating/core/data/data_source_getting/last_seen_calculation.dart';
// import 'package:bea_dating/core/data/data_source_getting/userdata.dart';
// import 'package:bea_dating/core/presentation/screen/chat_page/bloc/chat_bloc.dart';
// import 'package:bea_dating/core/presentation/screen/notification_page/notification_page.dart';
// import 'package:bea_dating/core/presentation/utilit/color.dart';
// import 'package:bea_dating/core/presentation/utilit/fonts.dart';
// import 'package:bea_dating/core/presentation/utilit/mediaquery.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// // ignore: must_be_immutable
// class IndividualChatPage extends StatefulWidget {
//   IndividualChatPage({
//     super.key,
//     required this.users,
//     this.chatRoomUid,required this.currentUserName
//   });
//   final Map<String, dynamic> users;
//   final String? chatRoomUid;
//   final String currentUserName;

//   @override
//   State<IndividualChatPage> createState() => _IndividualChatPageState();
// }

// class _IndividualChatPageState extends State<IndividualChatPage> {
//   AppFonts appFonts = AppFonts();
//   late ImageSource _imageSource;
//   String? imagePath;
//   UserData userData = UserData();

//   FirebaseAuth _auth = FirebaseAuth.instance;
//   String lastSeen = "";
//   TextEditingController textController = TextEditingController();
//   String currentUser="";
//   Stream<QuerySnapshot<Map<String, dynamic>>> usertream =
//       FirebaseFirestore.instance.collection("users").snapshots();

//   ScrollController _scrollController = ScrollController();
//   bool isShowEmoji = false;
//   @override
//   void initState() {
//     currentUser=_auth.currentUser!.uid;
//     isShowEmoji = false;
//     lastSeen = lastSeenCalculation(widget.users['lastSeen']);
//     // TODO: implement initState
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollToBottom();
//     });
//   }

//   void _scrollToBottom() async{
//     // Delay the scrolling to make sure the layout is fully rendered
//    await Future.delayed(Duration(milliseconds: 100), () {
//       _scrollController.jumpTo(
//         _scrollController.position.maxScrollExtent,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: BlocConsumer<ChatBloc, ChatState>(
//         listener: (context, state) {
//           if (state is EmojiCoditionState) {
//             isShowEmoji = state.isEmoji;
//           }
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: whiteclr,
//                 //  centerTitle: true,
//                 leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back_ios_new),
//                 ),
//                 titleSpacing: 0,
//                 title: InkWell(
//                   onTap: () { 
//                     Navigator.of(context).push(FadeTransitionPageRoute(child: ChatMorePage(user: widget.users)));
//                   },
//                   child: Row(
//                     children: [
//                       ChatUserProfileImage(widget: widget),
//                       SizedBox(
//                         width: mediaqueryWidth(.03, context),
//                       ),
//                       ChatProfileBasicDetails(widget: widget, appFonts: appFonts, lastSeen: lastSeen)
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () async{
//                         await ZegoUIKitPrebuiltCallInvitationService().init(
//                    appID: CallInfo.appId /*input your AppID*/,
//                    appSign: CallInfo.appSign /*input your AppSign*/,
//                    userID:currentUser,
//                   userName:  widget.currentUserName ,
//                   plugins: [ZegoUIKitSignalingPlugin()],
//                  );
//                  ZegoUIKitPrebuiltCallInvitationService().send(invitees: [ZegoCallUser( widget.users['uid'], widget.currentUserName)], isVideoCall: true);
         
//                       },
//                       child: Image.asset(
//                         'assets/icons8-video-48.png', 
//                         scale: 1.8,
//                       )),
//                   Transform.translate(
//                     offset: Offset(-12, 0),
//                     child: TextButton(
//                         onPressed: () async{
//                             await ZegoUIKitPrebuiltCallInvitationService().init(
//                    appID: CallInfo.appId /*input your AppID*/,
//                    appSign: CallInfo.appSign /*input your AppSign*/,
//                    userID:currentUser,
//                   userName:  widget.currentUserName ,
//                   plugins: [ZegoUIKitSignalingPlugin()],
//                  );
//                  ZegoUIKitPrebuiltCallInvitationService().send(invitees: [ZegoCallUser( widget.users['uid'], widget.currentUserName)], isVideoCall: false);
//                         },
//                         child: Image.asset(
//                           'assets/icons8-call-100.png',
//                           scale: 4.5,
//                         )),
//                   ),
//                 ],
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.only(bottom: 5),
//                 child: Container(
//                   height: double.infinity,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage("assets/chatbackground.JPEG"),
//                           fit: BoxFit.cover)),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: StreamBuilder(
//                             stream: userData
//                                 .getAllChat(widget.chatRoomUid.toString()),
//                             builder: (context,
//                                 AsyncSnapshot<
//                                         QuerySnapshot<Map<String, dynamic>>>
//                                     snapshot) {
//                               if (snapshot.hasError) {
//                                 return Text('Error: ${snapshot.error}');
//                               }

//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Center(
//                                     child: CircularProgressIndicator());
//                               }
//                               List<Map<String, dynamic>> mynotify =
//                                   snapshot.data!.docs
//                                       .map(
//                                         (doc) => doc.data(),
//                                       )
//                                       .toList();
//                               log(mynotify.toString());

//                               return mynotify.isNotEmpty
//                                   ? ListView.builder(
//                                       controller: _scrollController,
//                                       itemCount: mynotify.length,
//                                       itemBuilder: (context, index) {
//                                         final data = mynotify[index];
//                                         final String msg = data['msg'];
//                                         final String msgType = data["type"];
//                                         final bool isSender =
//                                             _auth.currentUser!.uid ==
//                                                 data['senderId'];
//                                         final timestamp =
//                                             data['timestamp'].toDate();
//                                         String time = DateFormat('hh:mm a')
//                                             .format(timestamp);
//                                         return ChatCard(isSender: isSender, msgType: msgType, msg: msg, appFonts: appFonts, time: time);
//                                       },
//                                     )
//                                   : Center(
//                                       child: Text(
//                                         "Say Haii 👋",
//                                         style: appFonts.flextext(blackclr,
//                                             Fweight: 400, size: 16),
//                                       ),
//                                     );
//                             }),
//                       ),
//                       _chatInput(context, widget.users['uid']),
//                       if (isShowEmoji)
//                         EmojiPickerWidget(textController: textController),
//                     ],
//                   ),
//                 ),
//               ));
//         },
//       ),
//     );
//   }

//   Widget _chatInput(BuildContext context, String receiverUid) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 5,
//         ),
//         Expanded(
//           child: Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             child: Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       FocusScope.of(context).unfocus();
//                       context
//                           .read<ChatBloc>()
//                           .add(EmojiCoditionEvent(isEmoji: true));
//                     },
//                     icon: Icon(
//                       Icons.emoji_emotions,
//                       size: 25,
//                       color: chatIconClr,
//                     )),
//                 Expanded(
//                     child: TextField(
//                   onTap: () {
//                     FocusScope.of(context).unfocus();
//                     context
//                         .read<ChatBloc>()
//                         .add(EmojiCoditionEvent(isEmoji: false));
//                   },
//                   controller: textController,
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     hintText: "Type something....",
//                     border: InputBorder.none,
//                   ),
//                 )),
//                 IconButton(
//                     // image button
//                     onPressed: () {
//                       context
//                           .read<ChatBloc>()
//                           .add(ImagePickEvent(receiverId: receiverUid));
//                     },
//                     icon: Icon(Icons.image, size: 25, color: chatIconClr)),
//                 // IconButton(
//                 //     // camer button
//                 //     onPressed: () {
//                 //       _imageSource = ImageSource.camera;
//                 //      imagePath=_getImage();
//                 //      if(imagePath!.isNotEmpty){
//                 //      context.read<ChatBloc>().add(CameraPickEvent(imagePath: imagePath!,receiverId:receiverUid ));
//                 //      }
//                 //     },
//                 //     icon: Icon(Icons.camera_alt, size: 26, color: chatIconClr))
//               ],
//             ),
//           ),
//         ),
//         MaterialButton(
//           onPressed: () {
//             if (textController.text.isNotEmpty) {
//               context.read<ChatBloc>().add(TesxtMessagesentEvent(
//                   text: textController.text, receiverId: receiverUid));
//               textController.clear();
//             }
//           },
//           minWidth: 0,
//           padding: EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 10),
//           color: chatSentIconClr,
//           shape: CircleBorder(),
//           child: Icon(Icons.send),
//         ),
//         SizedBox(
//           width: 5,
//         )
//       ],
//     );
//   }

//    // ignore: unused_element
//    _getImage() async {
//     final selectedImage = await ImagePicker().pickImage(source: _imageSource);
//     if (selectedImage != null) {
//     return selectedImage.toString();
//     }
//   }
// }
