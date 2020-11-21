import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity/connectivity.dart';
import 'package:velocity_x/velocity_x.dart';

class Auth {
  static Stream<User> checkUserLoggedIn() {
    return FirebaseAuth.instance.authStateChanges();
  }

  static Future<void> signIn(BuildContext context) async {
    final closeToast = context.showLoading(msg: 'Logging in..');
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
        closeToast();
      } else {
        closeToast();
        context.showToast(
          msg: 'Connect to Internet in order to SignIn',
          showTime: 3000,
        );
      }
    } on PlatformException catch (error) {
      closeToast();
      VxToast.show(
        context,
        msg: '$error',
        showTime: 3000,
      );
    } catch (error) {
      closeToast();

      print('error:$error');
    }
  }

  static Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
