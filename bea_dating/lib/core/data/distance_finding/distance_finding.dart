
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  
  const R = 6371; 
  // Radius of Earth in kilometers
  final dLat = _degToRad(lat2 - lat1);
  final dLon = _degToRad(lon2 - lon1);
    print("dipfinder>><<");
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_degToRad(lat1)) * cos(_degToRad(lat2)) *
      sin(dLon / 2) * sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return R * c; // Distance in kilometers
}

double _degToRad(double deg) {
  return deg * (pi / 180);
}

Future<List<Map<String, dynamic>>> findNearbyUsers(
    double myLat, double myLon, double radiusInKm) async {
  final usersCollection =await FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth=await FirebaseAuth.instance;
  final snapshot = await usersCollection.get();
  
  List<Map<String, dynamic>> nearbyUsers = [];
  
  for (var doc in snapshot.docs) {
    final data = doc.data();
  
    if(_auth.currentUser!.uid!=data['uid']){
    final userLat =double.parse(data['location']['latitude']);
    final userLon =double.parse( data['location']['longitude']);
     final distance = calculateDistance(myLat, myLon, userLat, userLon);
    
    if (distance <= radiusInKm) {
      nearbyUsers.add({
        'id': doc.id,
        'latitude': userLat,
        'longitude': userLon,
        'distance': distance,
      });
    }
   }
  }
  
  nearbyUsers.sort((a, b) => a['distance'].compareTo(b['distance']));
   // print("nrdipfinder>>${nearbyUsers}");
  return nearbyUsers;
}
 getNearbyUsers(double radiusInKm) async {

double myLat=0;
double myLon=0;

  final usersCollection =await FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth=await FirebaseAuth.instance;
  final snapshot = await usersCollection.get();
 
  for(var doc in snapshot.docs){
      if(_auth.currentUser!.uid==doc['uid']){
        myLat=double.parse( doc['location']['latitude']);
        myLon=double.parse(doc['location']['longitude']);
      }
           print("latitude${myLon}");

  }

  List<Map<String, dynamic>> nearbyUsers = await findNearbyUsers(myLat, myLon, radiusInKm);
      List<String>filterd=[];
  for (var user in nearbyUsers) {

    print('Fined User ID: ${user['id']}, Distance: ${user['distance']} km');
   filterd.add(user['id']) ;
  }
 print("${filterd}}") ;
 return filterd;
}