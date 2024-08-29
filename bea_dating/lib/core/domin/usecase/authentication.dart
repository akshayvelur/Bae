
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentic{
  Future<dynamic>signInWithGoogle()async{
   try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAthu =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAthu?.accessToken, idToken: googleAthu?.idToken);
      print("sign In");
      
      UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
      final myuser=userCredential;
  
      return myuser;

    } catch (e) {
      print(e);
    }}
//

 final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> signInWithGoogleAndCheckUser() async {
    try {
      // Step 1: Sign in with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("User cancelled the sign-in");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        // Step 2: Check if user exists in Firestore
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          // User already exists in Firestore
          print("User already exists: ${user.email}");
        } else {
          // New user, create a new document in Firestore
          print("New user, creating profile...");
          await _firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'uid': user.uid,
          });
          print("User profile created for ${user.email}");
        }
      }
    } catch (e) {
      print("Error during Google sign-in: $e");
    }
  }

//

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


  Future<void> localStorage(String uid,String email,String name)async{
    try{
     print("MY LOCAL////////////////");
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
    prefs.setString('email', email);
     prefs.setString('name',name );
    }catch(e){
      log("local Storage error${e}");
    }
  }

  //Local data getting
  Future<Map<String,dynamic>?> getLocalData()async{
    Map<String,dynamic>myUser={};
    print("data getting....");
    try{ SharedPreferences prefs= await SharedPreferences.getInstance();
 String? name=prefs.getString('name');
 String? email=prefs.getString('email');
 String? uid=prefs.getString('uid');
  myUser['uid']=uid;
  myUser['name']=name;
  myUser['email']=email;
 if(myUser!=null){
  return myUser;
 }
 }
 catch(e){
  log("get local data error${e}");
 }


  //log("myname");
  //log(name!);
   
  }
  Future <void>clearSharedpreference()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.remove("uid");
  prefs.remove("email");
  prefs.remove("name");
} 
}