import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

liketoUser(String like )async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  print(_auth.currentUser!.uid);
FirebaseFirestore _firestore= FirebaseFirestore.instance;
//Request 
DocumentReference documentReference= await FirebaseFirestore.instance.collection('users').doc(like);
await documentReference.update({"request":{_auth.currentUser!.uid:"request"}});
// update on the profile
DocumentReference documentReferenceforOwn= await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid);
await documentReferenceforOwn.update({"like":FieldValue.arrayUnion([like])});
}