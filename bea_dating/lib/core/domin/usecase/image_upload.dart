import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String>uploadImage(String childName,List<XFile>images)async{

  Uint8List temp=await images[0].readAsBytes();
 
  Reference ref=FirebaseStorage.instance.ref().child(childName).child("${DateTime.now().millisecondsSinceEpoch}.jpg");
  UploadTask uploadTask=ref.putData(temp);
  TaskSnapshot taskSnapshot=await uploadTask;
  String downloadUrl=await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}