import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<String>uploadImage(String childName,Uint8List imagei)async{

 try{
 print("image url adding");

  Reference ref=FirebaseStorage.instance.ref().child(childName).child("${DateTime.now().millisecondsSinceEpoch}.jpg");
     print("IMAGE REFFF${ref}");
  UploadTask uploadTask=ref.putData(imagei);
    print("UPLOAD TASK${uploadTask.snapshot}");
  TaskSnapshot taskSnapshot=await uploadTask;
    print("TASK SNAP${taskSnapshot}");
    
  String downloadUrl=await taskSnapshot.ref.getDownloadURL();
    print("DOWNLOAD URL${downloadUrl}");
  return downloadUrl;
  }catch(e){
   print("UPLOAD IMAGE${e}");
  }
  return "";
}