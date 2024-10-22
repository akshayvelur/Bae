import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
final String senderId;
final String receiverId;
final String msg;
final Timestamp timestamp;
final String type;
final bool isDeletedOrNot;

  Message({required this.senderId, required this.receiverId, required this.msg, required this.timestamp, required this.type, required this.isDeletedOrNot});
Map<String,dynamic>toMap(){
  return {
    "senderId":senderId,
    "receiverId":receiverId,
    "msg":msg,
    "timestamp":timestamp,
    "type":type,
    "isDeletedOrNot":isDeletedOrNot
  };
}
}