import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:bea_dating/core/presentation/screen/user_inital_data/username_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
 
// For Profile page
  Future<UserModel?> getUserData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    String? uid = instance.getString('uid');
    try {
      print("uid${uid}");
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      DocumentSnapshot snapshot =
          await _firestore.collection("users").doc(uid).get();
      print(snapshot.data());
      if (snapshot.exists && snapshot.data() != null) {
        print("Data fetched");
        return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        print('no user found');
      }
    } catch (e) {
      print("Get user error${e}");
    }
    return null;
  }

// For friends profile
  Future<UserModel?> viewProfile(String uid) async {
    //String ?uid= instance.getString('uid');
    try {
      //    print("uid${uid}");
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      DocumentSnapshot snapshot =
          await _firestore.collection("users").doc(uid).get();
      print(snapshot.data());
      if (snapshot.exists && snapshot.data() != null) {
        print("Data fetched");
        return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        print('no user found');
      }
    } catch (e) {
      print("Get user error${e}");
    }
    return null;
  }

//for homepage

// Stream<QuerySnapshot>getHomeData(){
//   return  _firestore.collection("users").snapshots();
// }

//  for Notification
  Future<List<Map<String, dynamic>>> getData() async {
    try {
      // Query to get documents from the 'users' collection
      QuerySnapshot snapshot = await _firestore.collection('users').get();

      // Convert the query snapshot to a list of maps
      List<Map<String, dynamic>> dataList = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      return dataList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return _firestore.collection("users").snapshots();
  }
  // ALL User Messages

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessage() {
    return _firestore.collection("messages").orderBy("timestamp").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChat(String chatRoomUid) {
    return _firestore
        .collection("messages")
        .doc(chatRoomUid)
        .collection('message')
        .orderBy("timestamp")
        .snapshots();
  }

  userNameFromFirebase()async{
String currentUserId = FirebaseAuth.instance.currentUser!.uid;

// Get the user's document reference
DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(currentUserId);

// Fetch the user's data
userRef.get().then((DocumentSnapshot snapshot) {
  if (snapshot.exists) {
    Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;
    if (userData != null) {
      String userName = userData['name'];
    
return userName;
      // Use the retrieved name and age
 
    }
  }
// ignore: body_might_complete_normally_catch_error
}).catchError((error) {
  print('Error getting user data: $error');
});
  }


  // User data
   getDataForDiscovery()async{
String currentUserId = FirebaseAuth.instance.currentUser!.uid;

// Get the user's document reference
DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(currentUserId);

// Fetch the user's data
userRef.get().then((DocumentSnapshot snapshot) {

  if (snapshot.exists) {
    Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>?;

    if (userData != null) {
            
    
return userData  ;
      // Use the retrieved name and age
 
    }
  }
// ignore: body_might_complete_normally_catch_error
}).catchError((error) {
  print('Error getting user data: $error');
});
  }
}
