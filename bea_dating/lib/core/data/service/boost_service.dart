import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Boost{
  boostService (int addBoost)async{
    print("boost service");
FirebaseAuth _auth= await FirebaseAuth.instance;
DocumentReference documentReference=await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid);
 DocumentSnapshot snapshot=await documentReference.get();
 String boost=snapshot.get("boost");
 if(boost.isNotEmpty){
  int currentBoost=int.parse(boost);
  currentBoost=currentBoost+addBoost;
  print("currentBoost${addBoost}");
  print("currentBoost${currentBoost}");
  documentReference.update({"boost":currentBoost.toString()});
 }else{
  documentReference.update({"boost":addBoost.toString()});
 }



  }
  // Boot count reducing 
    boostReducing (int addBoost)async{
    print("boost service");
FirebaseAuth _auth= await FirebaseAuth.instance;
DocumentReference documentReference=await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid);
 DocumentSnapshot snapshot=await documentReference.get();
 String boost=snapshot.get("boost");
 if(boost.isNotEmpty){
  int currentBoost=int.parse(boost);
  currentBoost=currentBoost-addBoost;
  print("currentBoost${addBoost}");
  print("currentBoost${currentBoost}");
  documentReference.update({"boost":currentBoost.toString()});
 }else{
  documentReference.update({"boost":addBoost.toString()});
 }



  }
}