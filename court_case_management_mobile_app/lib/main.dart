import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/profile_screen.dart';
import './screens/home_screen.dart';
import './screens/loading_screen.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';

//to build the apk for release run the command flutter build apk --split-per-abi

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Court Case Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato',
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headline1: TextStyle(
            fontFamily: 'Lato',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: StreamBuilder<User>(
        stream: Auth.checkUserLoggedIn(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting)
            return LoadingScreen();
          else {
            if (userSnapshot.hasData)
              return HomeScreen();
            else
              return AuthScreen();
          }
        },
      ),
      routes: {
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
      },
    );
  }
}
