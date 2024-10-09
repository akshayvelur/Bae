class UserModel {
  final String name;
  final String uid;
  final String dob;
  final String email;
  final String gender;
  final List<String> image;
  final String expectation;
  final String interest;
  final Map<String,dynamic> location;
  final Map<String,dynamic>profile;
 final List<String>like;
 final List<String>match;
 final Map<String,dynamic>request;

  UserModel(
      {required this.name,
      required this.uid,
      required this.dob,
      required this.email,
      required this.gender,
      required this.image,
      required this.expectation,
      required this.interest,
      required this.location,required this.profile,
     required this.like,required this.match,required this.request
      });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name']??'',
        uid: map['uid']??'',
        dob: map['dob']??'',
        email: map['email']??'',
        gender: map['gender']??'',
        image: List<String>.from(map['image']??''),
        expectation: map['expectation']??'',
        interest: map['interest']??'',
        location: map['location'] is Map<String, dynamic> ? map['location'] : {},
          profile:map['Profile'] is Map<String, dynamic> ? map['Profile'] : {},
         like:List<String>.from(map['like']??''),
         request :map['request'] is Map<String, dynamic> ? map['request'] : {},
         match:List<String>.from(map['match']??'')
         
          );
      
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
