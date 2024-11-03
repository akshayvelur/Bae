import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String uid;
  final String dob;
  final String email;
  final String gender;
  final List<String> image;
  final String expectation;
  final String interest;
  final Map<String, dynamic> location;
  final Map<String, dynamic> profile;
  final List<String> like;
  final List<String> match;
  final Map<String, dynamic> request;
  final List<String> chatUsers;
  final String status;
  final Timestamp? lastSeen;
  final String maxDistance;
  final String showme;
  final List<String>ageRange;

  UserModel(
      {required this.name,
      required this.uid,
      required this.dob,
      required this.email,
      required this.gender,
      required this.image,
      required this.expectation,
      required this.interest,
      required this.location,
      required this.profile,
      required this.like,
      required this.match,
      required this.request,
      required this.chatUsers,
      required this.status,
      required this.lastSeen,required this.ageRange,required this.maxDistance,required this.showme});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        uid: map['uid'] ?? '',
        dob: map['dob'] ?? '',
        email: map['email'] ?? '',
        gender: map['gender'] ?? '',
        image: List<String>.from(map['image'] ?? ''),
        expectation: map['expectation'] ?? '',
        interest: map['interest'] ?? '',
        location:
            map['location'] is Map<String, dynamic> ? map['location'] : {},
        profile: map['Profile'] is Map<String, dynamic> ? map['Profile'] : {},
        like: List<String>.from(map['like'] ?? ''),
        request: map['request'] is Map<String, dynamic> ? map['request'] : {},
        match: List<String>.from(
          map['match'] ?? '', ),
        chatUsers: List<String>.from(map['chatUsers'] ?? ''),
        status: map['status'] ?? '',
        lastSeen: map["lastSeen"] != null ? map["lastSeen"] as Timestamp : null,ageRange: List<String>.from(map['ageRange'])
        ,maxDistance:map['maxDistance']??"" ,
        showme: map['showme']??"");
  }
// Map<String,dynamic> toMap() {
//     return {
//       'name': name,
//       'uid': uid,
//       'dob': dob,
//       'email': email,
//       'gender': gender,
//       'image': image,
//       'expectation': expectation,
//       'interest': interest,
//       'location': location,
//       'Profile':profile
//     };
//   }
}
