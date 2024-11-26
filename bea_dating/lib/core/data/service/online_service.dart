 import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;
 
  void liveStatus(String status) async {
    final FirebaseAuth _auth=await FirebaseAuth.instance;
    await _firebaseStorage
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .update({"status": status});
    if (status == "offline") {
      Timestamp timestamp = Timestamp.now();
      await _firebaseStorage
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .update({"lastSeen": timestamp});
    }
  }
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     liveStatus("online");
  //   } else {
  //     liveStatus("offline");
  //     // if(_auth.currentUser !.ui) {
  //     //     liveStatus("offline");
  //     //   }
  //   }
  // }