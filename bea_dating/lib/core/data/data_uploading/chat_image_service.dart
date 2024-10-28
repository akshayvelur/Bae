
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<String>ChatImageUpload(String childName,var imagei)async{

 try{
 print("image url adding");

  Reference ref=FirebaseStorage.instance.ref().child(childName).child("${DateTime.now().millisecondsSinceEpoch}.jpg");
     print("ChatIMAGE ref ${ref}");
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
Future<String>ChatvideoUpload(String childName,var imagei)async{

 try{
 print("image url adding");

  Reference ref=FirebaseStorage.instance.ref().child(childName).child("${DateTime.now().millisecondsSinceEpoch}.mp4");
     print("ChatIMAGE ref ${ref}");
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