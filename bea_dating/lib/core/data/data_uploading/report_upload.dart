import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reporting{
  reportUploading(String reportUid)async{
    FirebaseAuth _auth=FirebaseAuth.instance;
    try{
      DocumentReference documentReference=await FirebaseFirestore.instance.collection('admin').doc("UsGDurBfKPJVxR1kInqh");
  DocumentSnapshot snapshot= await documentReference.get();
Map<String,dynamic>blockrequest=snapshot.get('blockRequest');
   if(blockrequest.keys.contains(reportUid)){
    print("reporting${reportUid}");
  int count= int.parse(blockrequest[reportUid]);
  count++;
  blockrequest[reportUid]=count.toString();
  documentReference.update({"blockRequest":blockrequest});
   }else{
    blockrequest[reportUid]="1";
     documentReference.update({"blockRequest":blockrequest});
   }
    }catch(e){
      log("reporting error${e}");
    }
  }
}