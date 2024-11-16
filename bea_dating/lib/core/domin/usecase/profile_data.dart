import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileData{
  final FirebaseAuth _auth = FirebaseAuth.instance;

 Future<dynamic> dataUpload(Map<String,dynamic>datas)async{

     try {
      DocumentReference documentReference =
          await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
          log("${_auth.currentUser!.uid}");
          DocumentSnapshot snapshot=await documentReference.get();
          Map<String,dynamic>_profile=snapshot.get('Profile');
         
          datas.forEach((key, value) {
            if(datas[key]!=null){
              _profile[key]=value;
            }
          },);
      await documentReference.update({"Profile":_profile});
    } catch (e) {
      log("data uploading${e}");  
    }
  }
}