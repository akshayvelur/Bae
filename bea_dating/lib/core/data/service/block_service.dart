import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Block{
  FirebaseAuth _auth=FirebaseAuth.instance;
  blockService(String uid)async{
    try{
 
DocumentReference documentReference=await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
DocumentSnapshot snapshot=await documentReference.get();
// adding to block list
documentReference.update({"blockList":FieldValue.arrayUnion([uid])});
// Removing block user from currnt account  like and match
// like removing 
 List<dynamic>like=snapshot.get("like");
 if(like.contains(uid)){
  like.remove(uid);
  documentReference.update({"like":like});
 }

 //match removing
  List<dynamic>match=snapshot.get("match");
 if(match.contains(uid)){
  match.remove(uid);
  documentReference.update({"match":match});
 }
// Removing current a/c from block account  like and match
DocumentReference documentReferenceBloker=await FirebaseFirestore.instance.collection("users").doc(uid);
DocumentSnapshot snapshotBlocker=await documentReferenceBloker.get();
String name=snapshot.get("name");
print("fdfdfdff${name}");
//Like removing 
List<dynamic>blockerLike=snapshotBlocker.get("like");
if(blockerLike.contains(_auth.currentUser!.uid)){
  blockerLike.remove(_auth.currentUser!.uid);
  documentReferenceBloker.update({"like":blockerLike});
}
//
//match removing 
List<dynamic>blockermatch=snapshotBlocker.get("match");
if(blockermatch.contains(_auth.currentUser!.uid)){
  blockermatch.remove(_auth.currentUser!.uid);
  documentReferenceBloker.update({"match":blockermatch});
}


    }catch(e){
      log("block service Error:${e}");
    }
  }
  unblockingService (String unblockId)async{
try{
DocumentReference documentReference =await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
DocumentSnapshot snapshot=await documentReference.get();
List<dynamic>blockList=snapshot.get("blockList");

blockList.remove(unblockId);
documentReference.update({'blockList':blockList});
}catch(e){
  log("unlocking error${e}");
}
  }
}