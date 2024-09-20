import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<String>uploadImage(String childName,Uint8List image)async{

 
 
  Reference ref=FirebaseStorage.instance.ref().child(childName).child("${DateTime.now().millisecondsSinceEpoch}.jpg");
  UploadTask uploadTask=ref.putData(image);
  TaskSnapshot taskSnapshot=await uploadTask;
  String downloadUrl=await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}