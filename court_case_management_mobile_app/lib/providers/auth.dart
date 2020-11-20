import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  static Stream<User> checkUserLoggedIn() {
    return FirebaseAuth.instance.authStateChanges();
  }

  static Future<void> signIn() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        Fluttertoast.showToast(
          msg: 'Connect to Internet in order to Sign-In',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (error) {
      print('error:$error');
    }
  }

  static Future<void> signout() async {
    //YET TO ADD IN UI.
    await FirebaseAuth.instance.signOut();
  }
}
