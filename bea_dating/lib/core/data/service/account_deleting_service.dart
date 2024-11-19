import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

accountDeleting(){
  FirebaseAuth _ath=FirebaseAuth.instance;
  FirebaseFirestore.instance.collection("users").doc(_ath.currentUser!.uid).delete();
}