
import 'package:bea_dating/core/data/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData{
 
  
Future<UserModel?> getUserData()async{
 SharedPreferences instance= await SharedPreferences.getInstance();
 String ?uid= instance.getString('uid');
  try{
      print("uid${uid}");
FirebaseFirestore _firestore=FirebaseFirestore.instance;
DocumentSnapshot snapshot =await _firestore.collection("users").doc(uid).get();
//print(snapshot.id);
if(snapshot.exists){
  print("Data fetched");
  return UserModel.fromMap(snapshot.data() as Map<String,dynamic>);
}
else{
  print ('no user found');
}}
catch(e){
  print("Get user error${e}");
}
  return null;
}
} 