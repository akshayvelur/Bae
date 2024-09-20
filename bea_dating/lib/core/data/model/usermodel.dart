class UserModel {
  final String name;
  final String uid;
  final String dob;
  final String email;
  final String gender;
  final List<String> image;
  final String expectation;
  final String interest;
  final String location;

  UserModel(
      {required this.name,
      required this.uid,
      required this.dob,
      required this.email,
      required this.gender,
      required this.image,
      required this.expectation,
      required this.interest,
      required this.location});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name']??'',
        uid: map['uid']??'',
        dob: map['dob']??'',
        email: map['email']??'',
        gender: map['gender']??'',
        image: List<String>.from(map['image']),
        expectation: map['expectation']??'',
        interest: map['interest']??'',
        location: map['location']??'');
  }
Map<String,dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'dob': dob,
      'email': email,
      'gender': gender,
      'image': image,
      'expectation': expectation,
      'interest': interest,
      'location': location,
    };
  }
}
