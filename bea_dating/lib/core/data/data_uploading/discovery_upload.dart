import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Discovery{
  discoveryUpload(List<String>ageRange,String maxDistance,String showme)async{
    print("jjjnjnnjn");
FirebaseAuth _auth=FirebaseAuth.instance;
try{
DocumentReference documentReference=await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
if(maxDistance.isNotEmpty){
await documentReference.update({"maxDistance":maxDistance});
}
if(ageRange.isNotEmpty){
await documentReference.update({"ageRange":ageRange});}
if(showme.isNotEmpty){
await documentReference.update({"showme":showme});
}
}catch(e){
  log("discoveryUpload ${e}");
}
  }
}