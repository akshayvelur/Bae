import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileImageUpdating{
   FirebaseAuth _auth=FirebaseAuth.instance;
  // uploading to firebase
  updating(String newimagei)async{

 DocumentReference documentReference=await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
 DocumentSnapshot snapshot=await documentReference.get();
 List<dynamic>image=snapshot.get("image");
 if(!image.contains(image.toString())){
  documentReference.update({'image':FieldValue.arrayUnion([newimagei])});
  
 }
  }
  // Storing to fire store
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
// Deteting profile image
deletingImages(String deletingImages)async{
  DocumentReference documentReference=await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid);
  DocumentSnapshot snapshot =await documentReference.get();
  List<dynamic>images=snapshot.get("image");
  if(images.contains(deletingImages)){
    images.remove(deletingImages);
  }
  documentReference.update({'image':images});
}

}