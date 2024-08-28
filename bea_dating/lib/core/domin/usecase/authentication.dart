import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentic{
  Future<dynamic>signInWithGoogle()async{
   try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAthu =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAthu?.accessToken, idToken: googleAthu?.idToken);
      print("sign In");
      
      UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
      
      return userCredential;
     // print(userCredential.user?.email);
    } catch (e) {
      print(e);
    }}
}