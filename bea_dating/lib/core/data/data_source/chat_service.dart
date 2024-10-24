import 'dart:developer';

import 'package:bea_dating/core/data/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chat {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _Auth = FirebaseAuth.instance;

  creatChatRoom(String receiverId, String text, String type) async {
    String senderId = _Auth.currentUser!.uid;
    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomUid = ids.join('_');

    DocumentReference senderref = await _firestore.collection("users").doc(senderId);
    senderref.update({
      "chatUsers": FieldValue.arrayUnion([chatRoomUid])
    });
    DocumentReference receiverref= await _firestore.collection("users").doc(receiverId);
    receiverref.update({"chatUsers":FieldValue.arrayUnion([chatRoomUid])});
    Timestamp timestamp = Timestamp.now();
    log(chatRoomUid);

    Message newmessage = Message(
        senderId: senderId,
        receiverId: receiverId,
        msg: text,
        timestamp: timestamp,
        type: type,
        isDeletedOrNot: false);
    final snapshot = await _firestore
        .collection("messages")
        .where('chatuid', isEqualTo: chatRoomUid)
        .limit(1)
        .get();
    if (snapshot.docs.length == 1) {
      await _firestore
          .collection("messages")
          .doc(chatRoomUid)
          .update({"timestamp": timestamp,"lastMsg":text});
           await _firestore
          .collection("messages")
          .doc(chatRoomUid)
          .collection("message")
          .add(newmessage.toMap());
    } else {
      await _firestore.collection("messages").doc(chatRoomUid).set({
        "senderId": senderId,
        "receiverId": receiverId,
        "chatuid": chatRoomUid,
        "timestamp": timestamp,
        "lastMsg":text
      });
      await _firestore
          .collection("messages")
          .doc(chatRoomUid)
          .collection("message")
          .add(newmessage.toMap());
    }
  }
}
