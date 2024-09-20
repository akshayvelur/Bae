import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentic {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String? userid;
  // signin with google
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAthu =
          await googleUser?.authentication;                                                           
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAthu?.accessToken, idToken: googleAthu?.idToken);
      print("sign In");
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
     userid=await _auth.currentUser!.uid;
      //   final myuser = userCredential;
    } catch (e) {
      print(e);
    }
  }

//create user
  Future<void> createUser(String name, String dob, String location,
      String gender, String interest, String expectation) async {
    try {
    
      // ignore: unused_local_variable
      final users =
          await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        'uid': _auth.currentUser!.uid,
        'defaultName': _auth.currentUser!.displayName,
        'email': _auth.currentUser!.email,
        'name': name,
        'dob': dob,
        'location': location,
        'gender': gender,
        'interest': interest,
        'expectation': expectation,
        
      });

      log("database created");
    } catch (e) {
      log(e.toString());
    }
  }
 static String imageUid=FirebaseFirestore.instance.collection("users").doc(userid).collection("images").doc().id;
   
  // Update Data
imageCollectionUpdate(List<String>images) async {
    log("updateing...");
    Map<String,String>image={};
    try{
   DocumentReference documentReference=await FirebaseFirestore.instance.collection("users").doc(userid);
   await documentReference.update({"image":images});
    }catch(e){

    }
  }
//
//User checking
  Future<bool> UserExitOrNot() async {
    final docRef =
        await _firestore.collection('users').doc(_auth.currentUser!.uid);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
     localStorage();
      return true;
    } else {
      
      //signOutFromGoogle();
      return false;
    }
  }
//Sign out
  Future<bool> signOutFromGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      clearSharedpreference();

      print("sign out");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
//Local storage
  Future<void> localStorage() async {
    try {
      print("MY LOCAL////////////////");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', _auth.currentUser!.uid);
      prefs.setString('email', _auth.currentUser!.email!);
      prefs.setString('name', _auth.currentUser!.displayName!);
    } catch (e) {
      log("local Storage error${e}");
    }
  }

  //Local data getting
  Future<Map<String, dynamic>?> getLocalData() async {
    Map<String, dynamic> myUser = {};
    print("data getting....");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? name = prefs.getString('name');
      String? email = prefs.getString('email');
      String? uid = prefs.getString('uid');
      myUser['uid'] = uid;
      myUser['name'] = name;
      myUser['email'] = email;
      // ignore: unnecessary_null_comparison
      if (myUser != null) {
        return myUser;
      }
    } catch (e) {
      log("get local data error${e}");
    }
    return null;
  }

  Future<void> clearSharedpreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("uid");
    prefs.remove("email");
    prefs.remove("name");
  }
}
