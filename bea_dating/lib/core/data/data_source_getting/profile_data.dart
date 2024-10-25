import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileData{
  final FirebaseAuth _auth = FirebaseAuth.instance;

 Future<dynamic> dataUpload(Map<String,dynamic>datas)async{

print("userprofile");
     try {
      DocumentReference documentReference =
          await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
          log("${_auth.currentUser!.uid}");
      await documentReference.update({"Profile":datas});
    } catch (e) {
      log("data uploading${e}");  
    }
  }
}