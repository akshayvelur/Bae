// import 'dart:developer';

// import 'package:bea_dating/core/data/constant/call_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// class CallPage extends StatefulWidget {
//   const CallPage(
//       {Key? key,
//       required this.callID,
//       required this.currentuserId,
//       required this.username})
//       : super(key: key);
//   final String callID;
//   final String username;
//   final String currentuserId;

//   @override
//   State<CallPage> createState() => _CallPageState();
// }

// class _CallPageState extends State<CallPage> {
//   @override
//   void initState() {
//     log(widget.callID);
//     log(widget.currentuserId.toString());
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ZegoSendCallInvitationButton(
//             resourceID: "Bae_DatingApp",
//             invitees: [
//               ZegoUIKitUser(id: widget.callID, name: widget.currentuserId)
//             ],
//             isVideoCall: true),
//       ),
//     );
//   }
// }

// // ZegoUIKitPrebuiltCall(

// //       appID: CallInfo.appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
// //       appSign:CallInfo.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
// //       userID:widget.callID.trim(),
// //       userName: widget.username,
// //       callID:  widget.currentuserId.trim(),
// //       // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
// //       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
// //     );