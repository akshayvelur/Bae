import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
 FirebaseAuth _auth=FirebaseAuth.instance;
 FirebaseFirestore _firestore= FirebaseFirestore.instance;
liketoUser(String like )async{

//Request 
try{
DocumentReference documentReference= await FirebaseFirestore.instance.collection('users').doc(like);
await documentReference.update({"request":FieldValue.arrayUnion([_auth.currentUser!.uid])});
}catch(e){
  log("Request user error ${e}");
}
// update on the profile
try{
DocumentReference documentReferenceforOwn= await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid);
await documentReferenceforOwn.update({"like":FieldValue.arrayUnion([like])});
}catch(e){
  log("update on the profile error ${e}");
}
}

requestAccepting(String accepted)async{
  try{
DocumentReference documentReference=await _firestore.collection("users").doc(_auth.currentUser!.uid);
await documentReference.update({"match":FieldValue.arrayUnion([accepted])});
  }catch(e){
    log("Request accepting error${e}");
  }
  try{
  
DocumentReference deleteReference =await _firestore.collection("users").doc(_auth.currentUser!.uid);
await deleteReference.update({"request":FieldValue.arrayRemove([accepted])});
  }catch(e){
    log("request deleted from notification error${e}");
  }
}