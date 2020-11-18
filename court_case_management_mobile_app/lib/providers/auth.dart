import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Stream<User> checkUserLoggedIn() {
    return FirebaseAuth.instance.authStateChanges();
  }

  static Future<void> signIn() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        print(event);
      });
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print('error:$error');
    }
  }

  static Future<void> signout() async {
    //YET TO ADD IN UI.
    await FirebaseAuth.instance.signOut();
  }
}
