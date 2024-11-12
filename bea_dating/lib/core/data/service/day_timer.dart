import 'dart:async';

import 'package:bea_dating/core/data/data_uploading/boost_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void scheduleDailyTask() async{

  print("dailty");
  DateTime now = DateTime.now();
  // Calculate time until next day starts (midnight)
  FirebaseAuth _auth=FirebaseAuth.instance;
DocumentReference documentReference=FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid) ;
 DocumentSnapshot snapshot=await documentReference.get();
 Timestamp boostTime=snapshot.get('freeBoostTime');
   DateTime nextDay ;

 nextDay = DateTime(now.year, now.month, now.day + 1);
 documentReference.update({"freeBoostTime":nextDay});

  Duration timeUntilMidnight =  nextDay.difference(now);                                    
  // nextDay.difference(now);
  //print("dailty${nextDay.difference(now)}");
  // Schedule a timer to call the function at midnight
  Timer(timeUntilMidnight, () {
    // Call your daily function
    yourDailyFunction();

    // Schedule the function to repeat at the same time each day
    scheduleDailyTask();
  });
}

void yourDailyFunction() {
    Boost boost=Boost(); FirebaseAuth _auth=FirebaseAuth.instance;
DocumentReference documentReference=FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid) ;
  documentReference.update({"freeBoostTime":DateTime.now()});
  print("Daily function executed at ${DateTime.now()}");
  boost.boostService(5);
  // Place the code you want to execute here
}
