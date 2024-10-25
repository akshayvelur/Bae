import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    SharedPreferences instance = await SharedPreferences.getInstance();
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
}