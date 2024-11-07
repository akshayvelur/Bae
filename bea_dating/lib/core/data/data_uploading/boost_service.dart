import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Boost{
  boostService ()async{
FirebaseAuth _auth= await FirebaseAuth.instance;
DocumentReference documentReference=await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid);




  }
}