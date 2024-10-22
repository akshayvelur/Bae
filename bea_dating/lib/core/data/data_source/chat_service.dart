import 'dart:developer';

import 'package:bea_dating/core/data/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _Auth = FirebaseAuth.instance;

  creatChatRoom(String receiverId, String text,String type) async {
      String senderId =  _Auth.currentUser!.uid;
    String chatRoomUid = receiverId + _Auth.currentUser!.uid.toString();
   DocumentReference ref= await _firestore.collection("users").doc(senderId);
   ref.update({"chatUsers":FieldValue.arrayUnion([receiverId])});
    Timestamp timestamp=Timestamp.now();
    log(chatRoomUid);
    Message newmessage=Message(senderId:senderId, receiverId: receiverId, msg: text, timestamp: timestamp, type: type, isDeletedOrNot: false);
    await _firestore.collection("messages").doc(chatRoomUid).set({"senderId":senderId,"receiverId":receiverId});
    await _firestore.collection("messages").doc(chatRoomUid).collection("message").add(newmessage.toMap());
  }
}
