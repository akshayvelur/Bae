// ignore_for_file: unused_element

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 FirebaseAuth _auth=FirebaseAuth.instance;
 FirebaseFirestore _firestore= FirebaseFirestore.instance;
 
viewedUser(String view )async{

//Request 
try{
DocumentReference documentReference= await FirebaseFirestore.instance.collection('users').doc(view);
DocumentSnapshot snapshot = await documentReference.get();
Map<String, dynamic> currentRequestMap = snapshot.get("request") ?? {};
// add to map
if(!currentRequestMap.keys.contains(view)){
currentRequestMap[_auth.currentUser!.uid]="Viewed your profile";
await documentReference.update({"request":currentRequestMap});}
}catch(e){
  log("Request user error ${e}");
}
}